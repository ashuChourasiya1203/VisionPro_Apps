import SwiftUI
import Combine
import UIKit

public class UIPilot<T: Equatable>: ObservableObject {
    
    private var _routes: [T] = []
    public var routes: [T] { return _routes }
    
    var onPush: ((T) -> Void)?
    var onPopLast: ((Int, Bool) -> Void)?
    
    public init(initial: T? = nil, debug: Bool = false) {
        if let initial = initial {
            push(initial)
        }
    }
    
    public func push(_ route: T) {
        self._routes.append(route)
        self.onPush?(route)
    }
    
    public func pop(animated: Bool = true) {
        if !self._routes.isEmpty {
            onPopLast?(1, animated)
        }
    }
    
    public func popTo(_ route: T, inclusive: Bool = false, animated: Bool = true) {
        if _routes.isEmpty { return }
        guard var found = _routes.lastIndex(where: { $0 == route }) else { return }
        
        if !inclusive {
            found += 1
        }
        let numToPop = (found..<_routes.endIndex).count
        _routes.removeLast(numToPop)
        onPopLast?(numToPop, animated)
    }
    
    public func onSystemPop() {
        if !self._routes.isEmpty {
            self._routes.removeLast()
        }
    }
}

public struct UIPilotHost<T: Equatable, Screen: View>: View {
    
    @StateObject var navigationStyle = NavigationStyle()
    @ViewBuilder let routeMap: (T) -> Screen
    let pilot: UIPilot<T>
    
    public init(_ pilot: UIPilot<T>, @ViewBuilder _ routeMap: @escaping (T) -> Screen) {
        self.pilot = pilot
        self.routeMap = routeMap
    }
    
    public var body: some View {
        NavigationControllerHost(
            navTitle: self.navigationStyle.title,
            navHidden: self.navigationStyle.isHidden,
            uipilot: self.pilot,
            routeMap: self.routeMap
        )
        .environmentObject(self.pilot)
        .environment(\.uipNavigationStyle, self.navigationStyle)
    }
}

struct NavigationControllerHost<T: Equatable, Screen: View>: UIViewControllerRepresentable {
    
    let navTitle: String
    let navHidden: Bool
    let uipilot: UIPilot<T>
    
    @ViewBuilder var routeMap: (T) -> Screen
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let navigation = PopAwareUINavigationController()
        
        navigation.popHandler = {
            self.uipilot.onSystemPop()
        }
        
        navigation.stackSizeProvider = {
            self.uipilot.routes.count
        }
        
        for path in self.uipilot.routes {
            navigation.pushViewController(
                UIHostingController(rootView: self.routeMap(path)), animated: true
            )
        }
        
        self.uipilot.onPush = { route in
            navigation.pushViewController(
                UIHostingController(rootView: self.routeMap(route)), animated: true
            )
        }
        
        self.uipilot.onPopLast = { numToPop, animated in
            if numToPop == navigation.viewControllers.count {
                navigation.viewControllers = []
            } else {
                let popTo = navigation.viewControllers[navigation.viewControllers.count - numToPop - 1]
                navigation.popToViewController(popTo, animated: animated)
            }
        }
        return navigation
    }
    
    func updateUIViewController(_ navigation: UINavigationController, context: Context) {
        navigation.topViewController?.navigationItem.title = self.navTitle
        navigation.navigationBar.isHidden = self.navHidden
    }
    
    static func dismantleUIViewController(_ navigation: UINavigationController, coordinator: ()) {
        navigation.viewControllers = []
        (navigation as! PopAwareUINavigationController).popHandler = nil
    }
    
    typealias UIViewControllerType = UINavigationController
}

class PopAwareUINavigationController: UINavigationController, UINavigationControllerDelegate{

    var popHandler: (() -> Void)?
    var stackSizeProvider: (() -> Int)?
    var popGestureBeganController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if let stackSizeProvider = stackSizeProvider{
            if stackSizeProvider() > navigationController.viewControllers.count {
                self.popHandler?()
            }
        }
    }
}

extension View {
    
    public func uipNavigationBarHidden(_ hidden: Bool) -> some View {
        return modifier(NavHiddenModifier(isHidden: hidden))
    }
    
    public func uipNavigationTitle(_ title: String) -> some View {
        return modifier(NavTitleModifier(title: title))
    }
    
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

private struct NavigationTitleKey: EnvironmentKey {
    static let defaultValue: Binding<String> = .constant("")
}

private struct NavigationHiddenKey: EnvironmentKey {
    static let defaultValue: Binding<Bool> = .constant(false)
}

private struct NavigationStyleKey: EnvironmentKey {
    static let defaultValue: NavigationStyle = NavigationStyle()
}

extension EnvironmentValues {
    
    var uipNavigationStyle: NavigationStyle {
        get { self[NavigationStyleKey.self] }
        set {
            self[NavigationStyleKey.self] = newValue
        }
    }
    
    var upNavigationHidden: Binding<Bool> {
        get { self[NavigationHiddenKey.self] }
        set {
            self[NavigationHiddenKey.self] = newValue
        }
    }
    
    var upNavigationTitle: Binding<String> {
        get { self[NavigationTitleKey.self] }
        set {
            self[NavigationTitleKey.self] = newValue
        }
    }
}

class NavigationStyle: ObservableObject {
    @Published
    var isHidden = false
    var isHiddenOwner: String = ""
    
    @Published
    var title = ""
    var titleOwner: String = ""
}

struct NavTitleModifier: ViewModifier {

    let title: String
    @State var id = UUID().uuidString
    @State var initialValue: String = ""
    
    @SwiftUI.Environment(\.uipNavigationStyle) var navStyle
    
    init(title: String) {
        self.title = title
    }
    
    func body(content: Content) -> some View {
        
        // In case where title change after onAppear
        if navStyle.titleOwner == id && navStyle.title != title {
            DispatchQueue.main.async {
                navStyle.title = title
            }
        }
        
        return content
            .onAppear {
                initialValue = navStyle.title
                
                navStyle.title = title
                navStyle.titleOwner = id
            }
            .onDisappear {
                if navStyle.titleOwner == id {
                    navStyle.title = initialValue
                    navStyle.titleOwner = ""
                }
            }
    }
}

struct NavHiddenModifier: ViewModifier {
    
    let isHidden: Bool
    @State var id = UUID().uuidString
    @State var initialValue: Bool = false
    
    @SwiftUI.Environment(\.uipNavigationStyle) var navStyle
    
    func body(content: Content) -> some View {
        /// In case where isHidden change after onAppear
        if self.navStyle.isHiddenOwner == self.id && self.navStyle.isHidden != self.isHidden {
            DispatchQueue.main.async {
                self.navStyle.isHidden = self.isHidden
            }
        }
        
        return content
            .onAppear {
                self.initialValue = self.navStyle.isHidden
                self.navStyle.isHidden = self.isHidden
                self.navStyle.isHiddenOwner = self.id
            }
            .onDisappear {
                if self.navStyle.isHiddenOwner == self.id {
                    self.navStyle.isHidden = self.initialValue
                    self.navStyle.isHiddenOwner = ""
                }
            }
    }
}

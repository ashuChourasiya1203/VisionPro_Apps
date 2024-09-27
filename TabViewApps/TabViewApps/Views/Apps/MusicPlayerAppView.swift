//
//  MusicPlayerAppView.swift
//  TabViewApps
//
//  Created by Apple on 15/03/24.
//

import SwiftUI
import ARKit
import Combine

struct MusicPlayerAppView: View {
    
    @State var isPlaying = false
    @State private var progress: CGFloat = 0.0
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
//            ZStack(alignment: .leading) {
//                RoundedRectangle(cornerRadius: 15)
//                    .fill(LinearGradient(
//                        gradient: Gradient(colors: [.purple,.pink]),
//                        startPoint: .topLeading,
//                        endPoint: .bottomTrailing
//                    ))
//                    .frame(width: geometry.size.width,height: geometry.size.height)
//            }
            //            .clipShape(RoundedRectangle(cornerRadius: 15))
            Image(.icMusicBG)
                .resizable()
                .frame(width:geometry.size.width,height: geometry.size.height)
                .clipShape(.rect(cornerRadius: 25))
        }
        .onReceive(self.timer) { _ in
            if self.isPlaying {
                self.progress += 0.01
                if self.progress >= 1.0 {
                    self.progress = 0.0
                    self.isPlaying = false
                }
            }
        }
        .onAppear {
            self.isPlaying = true
        }
        .toolbar {
            ToolbarItemGroup(placement: .topBarLeading) {
                Text("Follow along with real-time lyrics")
                    .font(.title)
                    .fontWeight(.heavy)
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomOrnament) {
                HStack(spacing:30) {
                    HStack(spacing:25) {
                        Image(systemName: "backward.fill")
                        Image(systemName: !self.isPlaying ? "play.fill" : "pause.fill")
                            .imageScale(.large)
                            .onTapGesture {
                                self.isPlaying.toggle()
                            }
                        Image(systemName: "forward.fill")
                    }
                    
                    VStack(alignment:.leading,spacing: -2) {
                        HStack {
                            Image(.icMusicBG)
                                .resizable()
                                .clipShape(.rect(cornerRadius: 7))
                                .frame(width: 50,height: 50)
                            VStack(alignment:.leading) {
                                Text("New")
                                    .font(.system(size: 16,weight: .medium))
                                    .foregroundStyle(Color.white)
                                Text("Lauren Daigle")
                                    .font(.system(size: 14,weight: .regular))
                                    .foregroundStyle(Color.white)
                            }
                            Spacer()

                            Image(systemName: "ellipsis").imageScale(.large).padding(.trailing,15)
                            
                        }
                        .padding(.all,5)
                        .glassBackgroundEffect(displayMode: .never)
                    
                        HStack(alignment: .firstTextBaseline) {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.gray)
                                .frame(width: self.progress * 390, height: 2.5, alignment: .leading)
                            Spacer()
                        }
                        .padding(.horizontal,5)
                    }
                    .background(.black.opacity(0.25))
                    .frame(width: 400,height: 60)
                    .clipShape(.rect(cornerRadius: 10))
                    
                    HStack(spacing:25) {
                        VStack{
                            Image(systemName: "quote.bubble")
                                .foregroundColor(.black)
                                .imageScale(.large)
                                .padding()
                        }
                        .background(.white)
                        .frame(width: 50,height: 50)
                        .clipShape(.rect(cornerRadius: 25))
                        
                        Image(systemName: "list.bullet")
                            .imageScale(.large)
                        Image(systemName: "speaker.wave.3.fill")
                    }
                }
                .padding(.leading,25)
                .padding(.trailing,25)
                .frame(width: 800,height: 60)
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    MusicPlayerAppView()
}

struct ChildView: View {
    let person = Person(name: "Akshay", lastName: "Mahajan")
    var body: some View {
        VStack {
            Text("Child View")
            
            NavigationLink(value: HomeNavigation.secondChild(person)) {
                Text("Click to enter second view")
            }
        }
        .navigationTitle("Child")
    }
}

struct ChildView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ChildView()
        }
    }
}

struct GoalsScreen: View {
    
    @Binding var path: [HomeNavigation]
    
    var body: some View {
        Text("Let's achieve some goals")
//        NavigationStack(path: $path) {
//            NavigationLink(value: HomeNavigation.child) {
//                Text("Click me to navigate")
//            }
//            .navigationDestination(for: HomeNavigation.self) { screen in
//                switch screen {
//                case .child: ChildView()
//                case .secondChild(let person): SecondChildView(person: person)
//                }
//            }
//        }
    }
}

struct GoalsScreen_Previews: PreviewProvider {
    static var previews: some View {
        GoalsScreen(path: .constant([HomeNavigation]()))
    }
}


struct SettingsScreen: View {
    var body: some View {
        Text("Change settings here")
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}

struct SecondChildView: View {
    let person: Person
    var body: some View {
        VStack(spacing: 10) {
            Text("Welcome \(person.name) \(person.lastName) to")
            Text("Second child view")
                .fontWeight(.bold)
            Text("of the Home View")
        }
        .navigationTitle("Second Child")
    }
}

struct SecondChildView_Previews: PreviewProvider {
    static var previews: some View {
        let person = Person(name: "Akshay", lastName: "Test")
        SecondChildView(person: person)
    }
}

struct Person: Hashable {
    let name: String
    let lastName: String
}

struct NavigationControllerHost<T: Equatable, Screen: View>: UIViewControllerRepresentable {
    
    let navTitle: String
    let navHidden: Bool
    let uipilot: UIPilot<T>
    //typealias UIViewControllerType = UINavigationController
    
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
        if let stackSizeProvider = self.stackSizeProvider {
            if stackSizeProvider() > navigationController.viewControllers.count {
                self.popHandler?()
            }
        }
    }
}

///////////////////////////////////

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
        NavigationControllerHost(navTitle: self.navigationStyle.title,
                                 navHidden: self.navigationStyle.isHidden,
                                 uipilot: self.pilot,
                                 routeMap: self.routeMap)
        .environmentObject(self.pilot)
        .environment(\.uipNavigationStyle, self.navigationStyle)
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



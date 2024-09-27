//
//  Navigation.swift
//  articlesApp
//
//  Created by Apple on 13/03/24.
//

import SwiftUI
import Combine
import UIKit

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

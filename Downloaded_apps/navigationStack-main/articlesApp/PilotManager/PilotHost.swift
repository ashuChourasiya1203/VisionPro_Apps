//
//  PilotHost.swift
//  articlesApp
//
//  Created by Apple on 13/03/24.
//

import SwiftUI

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

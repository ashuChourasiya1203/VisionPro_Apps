//
//  TabScreenView.swift
//  articlesApp
//
//  Created by AKSHAY MAHAJAN on 2023-08-15.
//

import SwiftUI

struct TabScreenView: View {
    
    @State private var selectedTab: Tab = .home
    @State private var homeNavigationStack: [HomeNavigation] = []
    
    //likewise you declare navigationStacks for each of the tabs
    var body: some View {
        TabView(selection: tabSelection()) {
            HomeScreen(path: $homeNavigationStack)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)
            
            GoalsScreen()
                .tabItem {
                    Label("Goals", systemImage: "flag")
                }
                .tag(Tab.goals)
            
            SettingsScreen()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(Tab.settings)
        }
    }
    
    private func tabSelection() -> Binding<Tab> {
        Binding { 
            ///this is the get block
            self.selectedTab
        } set: { tappedTab in
            if tappedTab == self.selectedTab {
                ///User tapped on the tab twice == Pop to root view
                if homeNavigationStack.isEmpty {
                    ///User already on home view, scroll to top
                } else {
                    homeNavigationStack = []
                }
            }
            ///Set the tab to the tabbed tab
            self.selectedTab = tappedTab
        }
    }
}

#Preview {
    TabScreenView()
}

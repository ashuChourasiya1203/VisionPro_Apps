//
//  MusicAppTabView.swift
//  TabViewApps
//
//  Created by Apple on 15/03/24.
//

import SwiftUI

struct MusicAppTabView: View {
    
    @State private var selectedTab: GameAppTab = .play
    @State private var homeNavigationStack: [HomeNavigation] = []
    
    //likewise you declare navigationStacks for each of the tabs
    var body: some View {
        TabView(selection: tabSelection()) {
            MusicPlayerAppView()
                .tabItem {
                    Label("Play Music", systemImage: "play.circle")
                        .font(.system(size: 15,weight: .semibold))
                }
                .tag(GameAppTab.play)
            
            GoalsScreen(path: $homeNavigationStack)
                .tabItem {
                    Label("Watch More", systemImage: "square.grid.2x2")
                        .font(.system(size: 15,weight: .semibold))
                }
                .tag(GameAppTab.more)
            
            SettingsScreen()
                .tabItem {
                    Label("Watch TV", systemImage: "music.note.tv")
                        .font(.system(size: 15,weight: .semibold))
                }
                .tag(GameAppTab.tv)
            
            SettingsScreen()
                .tabItem {
                    Label("Broadcast", systemImage: "dot.radiowaves.left.and.right")
                        .font(.system(size: 15,weight: .bold))
                }
                .tag(GameAppTab.broadcast)
            
            SettingsScreen()
                .tabItem {
                    Label("Play List", systemImage: "play.square.stack")
                        .font(.system(size: 15,weight: .semibold))
                }
                .tag(GameAppTab.list)
            
            SettingsScreen()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                        .font(.system(size: 15,weight: .semibold))
                }
                .tag(GameAppTab.search)
        }
    }
    
    private func tabSelection() -> Binding<GameAppTab> {
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
    MusicAppTabView()
}

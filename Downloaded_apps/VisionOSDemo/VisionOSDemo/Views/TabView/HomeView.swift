//
//  HomeView.swift
//  VisionOSDemo
//
//  Created by Ravi Jadav on 11/03/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView {
            EarthView().tabItem {
                Image("ic_earth", bundle: nil)
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .tag("One")
            
            EventView().tabItem {
                Image("ic_menu", bundle: nil)
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .tag("Two")
        }
    }
}

#Preview {
    HomeView()
}

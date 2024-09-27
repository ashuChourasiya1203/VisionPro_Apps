//
//  ContentView.swift
//  TabViewApps
//
//  Created by Apple on 15/03/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State private var isAppleMusicOpen = false
    @State private var isAppleSportsAppOpen = false
    @State private var isAppleOTTAppOpen = false
    @State private var isAppleStatisticAppOpen = false
    
    var body: some View {
        HStack {
            Button(action: {
                print("AppleMusic")
                self.isAppleSportsAppOpen = false
                self.isAppleMusicOpen.toggle()
                self.isAppleOTTAppOpen = false
                self.isAppleStatisticAppOpen = false
            }, label: {
                Text("AppleMusic")
            })
            
            Button(action: {
                print("AppleSports")
                self.isAppleSportsAppOpen.toggle()
                self.isAppleMusicOpen = false
                self.isAppleOTTAppOpen = false
                self.isAppleStatisticAppOpen = false
            }, label: {
                Text("AppleSports")
            })
            
            Button(action: {
                print("AppleOTT")
                self.isAppleSportsAppOpen = false
                self.isAppleMusicOpen = false
                self.isAppleOTTAppOpen.toggle()
                self.isAppleStatisticAppOpen = false
            }, label: {
                Text("AppleOTT")
            })
            
            Button(action: {
                print("AppleStatistic")
                self.isAppleSportsAppOpen = false
                self.isAppleMusicOpen = false
                self.isAppleOTTAppOpen = false
                self.isAppleStatisticAppOpen.toggle()
                
            }, label: {
                Text("AppleStatistic")
            })
        }
        
        HStack {
            if self.isAppleMusicOpen {
                MusicAppTabView()
            } else if self.isAppleSportsAppOpen {
                
            } else if self.isAppleOTTAppOpen {
                
            } else if self.isAppleStatisticAppOpen {
                
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}

//
//  TabViewAppsApp.swift
//  TabViewApps
//
//  Created by Apple on 15/03/24.
//

import SwiftUI

@main
struct TabViewAppsApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}

//
//  VisionOSDemoApp.swift
//  VisionOSDemo
//
//  Created by Ravi Jadav on 08/03/24.
//

import SwiftUI

@main
struct VisionOSDemoApp: App {
    
    @StateObject var pilot = UIPilot(initial: AppRoute.landingView)
        
    var body: some Scene {
        WindowGroup {
            UIPilotHost(pilot) { route in
                switch route  {
                case .landingView: LandingView().frame(
                    minWidth: 1520, maxWidth: 1520,
                    minHeight: 867, maxHeight: 867
                )
                case .registerView: RegisterView()
                case .homeview: HomeView()
                case .artistView: ArtistView()
                }
            }
        }
        .windowStyle(.plain)
        .windowResizability(.contentSize)
    }
}

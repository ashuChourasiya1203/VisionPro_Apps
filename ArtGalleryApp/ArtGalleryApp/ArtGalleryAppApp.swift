//
//  ArtGalleryAppApp.swift
//  ArtGalleryApp
//
//  Created by Ashutosh Chourasiya on 18/03/24.
//

import SwiftUI

@main
struct ArtGalleryAppApp: App {
        
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}

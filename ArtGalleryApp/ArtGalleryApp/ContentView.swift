//
//  ContentView.swift
//  ArtGalleryApp
//
//  Created by Ashutosh Chourasiya on 18/03/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State private var showArtGallery = false
    @State private var immersiveSpaceIsShown = false    
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        VStack {
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)

            Text("Hello, Ashutosh!")

            Toggle(showArtGallery ? "Hide Gallery" : "Show Gallery", isOn: $showArtGallery)
                .font(.title)
                .frame(width: 360)
                .padding(24)
                .glassBackgroundEffect()
            
        }
        .padding()
        .onChange(of: self.showArtGallery) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        immersiveSpaceIsShown = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        immersiveSpaceIsShown = false
                        showArtGallery = false
                    }
                } else if immersiveSpaceIsShown {
                    await dismissImmersiveSpace()
                    immersiveSpaceIsShown = false
                }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}

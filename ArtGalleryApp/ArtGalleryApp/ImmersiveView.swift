//
//  ImmersiveView.swift
//  ArtGalleryApp
//
//  Created by Ashutosh Chourasiya on 18/03/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
        
    @State var isLightOn = true
    
    var body: some View {
        RealityView { content in
            
            // Add the initial RealityKit content
            if let immersiveContentEntity = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                immersiveContentEntity.position.y = 8.5 /// Maintain Up and down position
                immersiveContentEntity.position.x = -3 ///Maintain left and right positon
                immersiveContentEntity.position.z = -35 ///Maintain fron to back positon.
                immersiveContentEntity.scale = SIMD3<Float>(repeating: 1.0)
                content.add(immersiveContentEntity)
                
                let lightIntensity : Float = self.isLightOn ? 0.8 : -3
                guard let resource = try? await EnvironmentResource(named: "ImageBasedLight") else { return }
                let iblComponent = ImageBasedLightComponent(source: .single(resource), intensityExponent: lightIntensity)
                immersiveContentEntity.components.set(iblComponent)
                immersiveContentEntity.components.set(ImageBasedLightReceiverComponent(imageBasedLight: immersiveContentEntity))
                
                // Put skybox here.  See example in World project available at
                // https://developer.apple.com/
            }
        }
    }
}

#Preview(immersionStyle: .full) {
    ImmersiveView()
}

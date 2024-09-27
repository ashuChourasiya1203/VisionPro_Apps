//
//  CapsuleRealityArea.swift
//  InspirationSpace
//
//  Created by Ashutosh Chourasiya on 13/03/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct CapsuleRealityArea: View {
    
    @Environment(ViewModel.self) private var model
    @State private var capsule: Entity?
    let attachmentID = "attachmentID"
    
    var body: some View {
        RealityView { content ,attachment in
            guard let entity = try? await Entity(named: "Scene",in: realityKitContentBundle) else {
                fatalError("Unable to load scene model")
            }
            content.add(entity)
            
            self.capsule = entity
            self.capsule?.setSunlight(intensity: 13)
            self.capsule?.components.set(
                OrbitComponent( radius: 0.02, speed: 0, addOrientationRotation: true )
            )
            
            if let sceneAttachment = attachment.entity(for: self.attachmentID){
                sceneAttachment.position = SIMD3<Float>(-0.2,-0.1,0.1)
                sceneAttachment.transform.rotation = simd_quatf(angle: -0.5, axis: SIMD3<Float>(1,0,0))
                content.add(sceneAttachment)
            }
                
        } update: { content,attachment in
            print("Reality view changes detected....")
        } placeholder : {
            ProgressView().progressViewStyle(.circular).controlSize(.large)
        } attachments: {
            Attachment(id: self.attachmentID) {
                CapsuleDetails {
                    self.capsule?.setSunlight(intensity: 13)
                } turnOffLight: {
                    self.capsule?.setSunlight(intensity: 6)
                } turnOnOrbit: {
                    self.capsule?.components[OrbitComponent.self]?.speed = 1
                } turnOffOrbit: {
                    self.capsule?.components[OrbitComponent.self]?.speed = 0
                }
            }
        }
        .onDisappear {
            self.model.isShowingRocketCapsule = false
        }
    }
}

#Preview {
    CapsuleRealityArea().environment(ViewModel())
}


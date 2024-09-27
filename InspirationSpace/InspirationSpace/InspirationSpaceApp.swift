//
//  InspirationSpaceApp.swift
//  InspirationSpace
//
//  Created by Ashutosh Chourasiya on 13/03/24.
//

import SwiftUI

@main
struct InspirationSpaceApp: App {
    
    @State private var model = ViewModel()
    
    var body: some Scene {
        
        WindowGroup("Main Areas", id: "Areas") {
            Areas().environment(self.model)
        }
        
        WindowGroup(id: self.model.capsuleRealityAreaId){
            CapsuleRealityArea().environment(self.model)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.65, height: 0.3, depth: 0.3, in: .meters)
        
        ImmersiveSpace(id: self.model.fullRocketRealityArea){
            FullRocketRealityArea().environment(model)
        }
        .immersionStyle(selection: .constant(.full), in: .full)
        
        ImmersiveSpace(id: self.model.mixedRocketRealityArea){
            FullRocketRealityArea().environment(model)
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
    }
    
    init(){
        OrbitComponent.registerComponent()
        OrbitSystem.registerSystem()
    }
}

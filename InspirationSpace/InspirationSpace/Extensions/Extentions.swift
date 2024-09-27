//
//  Extentions.swift
//  InspirationSpace
//
//  Created by Apple on 14/03/24.
//

import RealityKit

/// Credits to Apple for providing this example!
/// 
extension Entity {
    func setSunlight(intensity: Float?) {
        if let intensity {
            Task {
                guard let resource = try? await EnvironmentResource(named: "Sunlight") else { return }
                let iblComponent = ImageBasedLightComponent(
                    source: .single(resource),
                    intensityExponent: intensity)
                
                components.set(iblComponent)
                components.set(ImageBasedLightReceiverComponent(imageBasedLight: self))
            }
        } else {
            components.remove(ImageBasedLightComponent.self)
            components.remove(ImageBasedLightReceiverComponent.self)
        }
    }
}


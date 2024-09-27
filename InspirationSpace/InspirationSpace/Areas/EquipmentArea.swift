//
//  EquipmentArea.swift
//  InspirationSpace
//
//  Created by Ashutosh Chourasiya on 13/03/24.
//

import SwiftUI

struct EquipmentArea: View {
    
    @Environment(ViewModel.self) private var model
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    var body: some View {
        @Bindable var model = self.model
        
        HStack {
            EquipmentCard(
                isShowing: $model.isShowingRocketCapsule,
                toggleTitle: "Rocket Capsule (Volumetric)",
                imageName: "equipment-capsule"
            ){
                self.openWindow(id: model.capsuleRealityAreaId)
            } dismissCard: {
                self.dismissWindow(id: model.capsuleRealityAreaId)
            }
            
            EquipmentCard(
                isShowing: $model.isShowingFullRocket,
                toggleTitle: "Rocket (Full Immersive Space)",
                imageName: "equipment-fullrocket"
            ) {
                await self.openImmersiveSpace(id: model.fullRocketRealityArea)
            } dismissCard: {
                await self.dismissImmersiveSpace()
            }
            
            EquipmentCard(
                isShowing: $model.isShowingMixedRocket,
                toggleTitle: "Rocket (Mixed Immersive Space)",
                imageName: "equipment-mixedrocket"
            ) {
                await self.openImmersiveSpace(id: model.mixedRocketRealityArea)
            } dismissCard: {
                await self.dismissImmersiveSpace()
            }
        }
    }
}

#Preview {
    EquipmentArea().environment(ViewModel())
}

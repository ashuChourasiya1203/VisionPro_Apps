//
//  EquipmentCard.swift
//  InspirationSpace
//
//  Created by Apple on 14/03/24.
//

import SwiftUI

struct EquipmentCard: View {
    
    @Binding var isShowing: Bool
    let toggleTitle: String
    let imageName: String
    let openCard: () async -> Void
    let dismissCard: () async -> Void
    
    var body: some View {
        VStack(spacing: 10) {
            Image(self.imageName)
                .resizable()
                .frame(width: 300,height: 300)
                .padding(25)
            
            Toggle(isShowing ? "Hide \(toggleTitle)" : "Show \(toggleTitle)",isOn: $isShowing)
                .onChange(of: isShowing, initial: false){ isShowing , initial  in
                    Task {
                        if !isShowing {
                            await openCard()
                        } else {
                            await dismissCard()
                        }
                    }
            }
            .toggleStyle(.button)
            .padding(25)
        }.glassBackgroundEffect()
    }
}

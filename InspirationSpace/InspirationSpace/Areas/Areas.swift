//
//  Areas.swift
//  InspirationSpace
//
//  Created by Ashutosh Chourasiya on 13/03/24.
//

import SwiftUI

struct Areas: View {
    
    @Environment(ViewModel.self) private var model
    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    var body: some View {
        ZStack {
            NavigationStack {
                NavigationToAreas()
            }
        }
        
        .onChange(of: scenePhase) { _, newScenePhase in
            if (model.isShowingFullRocket || model.isShowingMixedRocket) && newScenePhase == .background {
                Task {
                    await dismissImmersiveSpace();
                }
            }
        }
    }
}

#Preview {
    Areas()
}

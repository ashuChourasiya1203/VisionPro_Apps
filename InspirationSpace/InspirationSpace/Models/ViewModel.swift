//
//  ViewModel.swift
//  InspirationSpace
//
//  Created by Ashutosh Chourasiya on 13/03/24.
//

import SwiftUI

@Observable class ViewModel {
    
    var navigationPath : [Area] = []
    var isShowingRocketCapsule : Bool = false
    var isShowingFullRocket : Bool = false
    var isShowingMixedRocket : Bool = false
    
    var capsuleRealityAreaId: String = "CapsuleRealityArea"
    var fullRocketRealityArea: String = "FullRocketRealityArea"
    var mixedRocketRealityArea: String = "MixedRocketRealityArea"
    
}

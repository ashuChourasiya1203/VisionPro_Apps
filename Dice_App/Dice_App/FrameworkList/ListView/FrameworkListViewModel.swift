//
//  FrameworkListViewModel.swift
//  Apple_Framework_App
//
//  Created by Ashutosh Chourasiya on 07/03/24.
//

import SwiftUI

final class FrameworkListViewModel : ObservableObject {
    var selectedFramework : Framework?{
        didSet {
            self.isShowingDetailView = true
        }
    }
    @Published var isShowingDetailView = false
    
    let columns : [GridItem] = [GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible())]
}

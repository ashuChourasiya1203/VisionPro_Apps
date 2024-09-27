//
//  MultipleWindowsApp.swift
//  MultipleWindows
//
//  Created by Apple on 19/03/24.
//

import SwiftUI

@main
struct MultipleWindowsApp: App {
    
    var viewModel = ColorStringViewModel()
    
    var body: some Scene {
        WindowGroup {
            ColorListView(viewModel: self.viewModel)
        }
        
        WindowGroup(for: ColorString.ID.self) { $colorStringId in
            ColorView(viewModel : self.viewModel, colorStringID : $colorStringId)
        }
        .defaultSize(width: 300, height: 300)
    }
}

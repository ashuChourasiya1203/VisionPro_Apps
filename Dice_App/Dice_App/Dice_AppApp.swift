//
//  Dice_AppApp.swift
//  Dice_App
//
//  Created by Apple on 11/03/24.
//

import SwiftUI

@main
struct Dice_AppApp: App {
    var body: some Scene {
        WindowGroup {
            //FrameworkListView()
            FrameworkGridView()
                .frame(
                    minWidth: 800, maxWidth: 800,
                    minHeight: 900, maxHeight: 1200
                )
        }
        .defaultSize(width: 800, height: 900)
        .windowStyle(.plain)
        .windowResizability(.contentSize)
    }
}

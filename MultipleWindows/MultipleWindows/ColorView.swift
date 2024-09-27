//
//  ColorView.swift
//  MultipleWindows
//
//  Created by Apple on 19/03/24.
//

import SwiftUI

struct ColorView: View {
    
    var viewModel = ColorStringViewModel()
    @Binding var colorStringID : UUID?
    
    var body: some View {
        if let colorStringID = self.colorStringID,
           let colorString = viewModel[colorStringId: colorStringID]{
            
            VStack {
                Text(colorString.string)
                    .frame(width: 300,height: 300)
                    .background(colorString.color)
                    .glassBackgroundEffect(displayMode: .implicit)
            }
        }
    }
}

//#Preview {
//    ColorView()
//}

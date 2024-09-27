//
//  ColorListView.swift
//  MultipleWindows
//
//  Created by Apple on 19/03/24.
//

import SwiftUI

struct ColorListView: View {
    
    @Environment(\.openWindow) private var openWindow
    var viewModel : ColorStringViewModel
    
    var body: some View {
        VStack {
            ForEach(viewModel.colorStrings) { color in
                Button {
                    self.openWindow(value: color.id)
                } label: {
                    Text(color.string)
                }
                .background(color.color)
                .clipShape(.capsule)
            }
        }
    }
}

#Preview {
    ColorListView(viewModel: ColorStringViewModel())
}

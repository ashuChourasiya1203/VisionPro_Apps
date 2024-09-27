//
//  FrameworkTitleViewGrid.swift
//  Dice_App
//
//  Created by Apple on 11/03/24.
//

import SwiftUI

struct FrameworkTitleViewGrid : View {
    let framework : Framework
    var size : CGFloat = 100
    
    var body: some View {
        VStack {
            Image(self.framework.imageName)
                .resizable()
                .frame(width: self.size, height: self.size)
            
            Text(self.framework.name)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color(.label))
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        .padding()
        .glassBackgroundEffect(displayMode: .implicit)
    }
}

#Preview(windowStyle:.automatic) {
    FrameworkTitleViewGrid(framework: MockData.sampleFramework)
}

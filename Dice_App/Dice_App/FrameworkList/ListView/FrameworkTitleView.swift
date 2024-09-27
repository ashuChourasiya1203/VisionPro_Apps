//
//  FrameworkTitleView.swift
//  Apple_Framework_App
//
//  Created by Apple on 07/03/24.
//

import SwiftUI

struct FrameworkTitleView : View {
    let framework : Framework
    var size : CGFloat = 70
    var titleFontSize : CGFloat = 16
    
    var body: some View {
        HStack {
            Image(self.framework.imageName)
                .resizable()
                .frame(width: self.size, height: self.size)
            
            Text(self.framework.name)
                .font(.system(size: self.titleFontSize,weight: .medium))
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
                .padding(.leading,5)
        }
    }
}

#Preview(windowStyle: .automatic){
    FrameworkTitleView(framework: MockData.sampleFramework)
}

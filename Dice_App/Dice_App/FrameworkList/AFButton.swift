//
//  AFButton.swift
//  Apple_Framework_App
//
//  Created by Apple on 06/03/24.
//

import SwiftUI

struct AFButton: View {
    var title : String
    var body: some View {
        Text(title)
            .font(.system(size: 35,weight: .semibold))
            .frame(width: .infinity,height: 60)
            .foregroundColor(.white)
            .background(.red)
            .cornerRadius(10)
    }
}

#Preview(windowStyle: .automatic){
    AFButton(title: "Button Title")
}

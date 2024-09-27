//
//  XDismissButton.swift
//  Apple_Framework_App
//
//  Created by Apple on 07/03/24.
//

import SwiftUI

struct XDismissButton: View {
    
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        HStack {
            Spacer()
            
            Button {
                isShowingDetailView = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
            }
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic){
    XDismissButton(isShowingDetailView: .constant(false))
}

//
//  RegisterView.swift
//  VisionOSDemo
//
//  Created by Ravi Jadav on 08/03/24.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var router : UIPilot<AppRoute>
    
    var body: some View {
        VStack(content: {
            HStack(content: {
                Image("ic_landing", bundle: nil)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 195, height: 195)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 80))
                Text("SAIRYŌ")
                    .font(.system(size: 160))
                    .fontWeight(.bold)
            })
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 25, trailing: 0))
            
        })
    }
}

#Preview {
    RegisterView()
}

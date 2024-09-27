//
//  FrameworkDetailsViewGrid.swift
//  Dice_App
//
//  Created by Ashutosh Chourasiya on 11/03/24.
//

import SwiftUI

struct FrameworkDetailsViewGrid: View {
    
    let framework : Framework
    @State var isShowingSafariView : Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    FrameworkTitleView(framework: self.framework,size: 100,titleFontSize: 30)
                    Text(self.framework.description)
                        .padding(.all,50)
                        .font(.system(size: 30,weight: .semibold))
                }
                .scrollBounceBehavior(.basedOnSize)
                
                Button(action: {
                    print("Learn More Tapped...")
                    self.isShowingSafariView = true
                }, label: {
                    Text("Learn More").font(.system(size: 35,weight: .semibold))
                })
                .frame(width: 600,height: 100)
                .foregroundColor(.white)
                .background(.red)
                .cornerRadius(25)
                .padding(.all,30)
                .buttonStyle(.plain)
                
                Spacer(minLength: 20)
            }
            .padding(.top,25)
            .navigationDestination(isPresented: self.$isShowingSafariView, destination: {
                SafariView(url: URL(string: self.framework.urlString)!)
            })
        }
    }
}

#Preview(windowStyle:.automatic) {
    FrameworkDetailsViewGrid(framework: MockData.sampleFramework)
        .preferredColorScheme(.dark)
}

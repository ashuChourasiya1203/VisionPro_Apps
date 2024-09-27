//
//  FrameworkDetailsView.swift
//  Apple_Framework_App
//
//  Created by Ashutosh Chourasiya on 06/03/24.
//

import SwiftUI

struct FrameworkDetailsView: View {
    
    let framework : Framework
    @Binding var isShowingDetailView : Bool
    @State var isShowingSafariView : Bool = false
    
    var body: some View {
        VStack {            
            ScrollView {
                FrameworkTitleView(framework: self.framework,size: 150)
                Text(self.framework.description)
                    .padding()
                    .font(.body)
                    .fontWeight(.medium)
                Spacer()
            }
            .scrollBounceBehavior(.automatic)
            Button {
                print("Learn More Tapped...")
                self.isShowingSafariView = true
            } label: {
                AFButton(title: "Learn More")
                //Label("Learn More",systemImage: "book.fill").fontWeight(.bold)
            }.padding()
//            .padding(.top,20)
//            .padding(.bottom,10)
//            .buttonStyle(.borderedProminent)
//            .controlSize(.large)
////            .foregroundColor(.white)
////            .buttonBorderShape(.roundedRectangle(radius: 10))
//            .tint(.red)
        }
        .fullScreenCover(isPresented: self.$isShowingSafariView){
            SafariView(url: URL(string: self.framework.urlString)!)
        }
    }
}

#Preview(windowStyle: .automatic){
    FrameworkDetailsView(framework: MockData.sampleFramework,
                         isShowingDetailView: .constant(false))
    .preferredColorScheme(.dark)
}



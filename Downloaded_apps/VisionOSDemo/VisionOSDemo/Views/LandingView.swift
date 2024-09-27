//
//  LandingView.swift
//  VisionOSDemo
//
//  Created by Ravi Jadav on 08/03/24.
//

import SwiftUI

struct LandingView: View {
    
    @EnvironmentObject var router: UIPilot<AppRoute>
    
    init() {}
    
    var body: some View {
        VStack {
            Spacer()
            HStack(content: {
                Image("ic_landing", bundle: nil)
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 190, height: 190)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 100))
                Text("SAIRYŌ")
                    .font(.system(size: 170))
                    .fontWeight(.bold)
            })
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 70, trailing: 0))
            HStack(content: {
                Button(action: {
                    router.push(.homeview)
                }, label: {
                    Text("Create Account")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .frame(width: 270, height: 70)
                        .background(.theme5E5E5E.opacity(0.20))
                        .clipShape(RoundedRectangle(cornerRadius: 45, style: .circular))
                })
                .buttonStyle(.plain)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 50))
                
                NavigationLink {
                    
                } label: {
                    Text("Sign In")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .frame(width: 270, height: 70)
                        .background(.theme4FB400)
                        .clipShape(RoundedRectangle(cornerRadius: 45, style: .circular))
                }
                //                    Button(action: {
                //
                //                    }, label: {
                //                        Text("Sign In")
                //                            .font(.system(size: 25))
                //                            .fontWeight(.semibold)
                //                            .frame(width: 270, height: 70)
                //                            .background(.theme4FB400)
                //                            .clipShape(RoundedRectangle(cornerRadius: 45, style: .circular))
                //                    })
                .buttonStyle(.plain)
            })
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 130, trailing: 0))
            HStack {
                Text("© 2024 Sairyō | All rights reserved.")
                    .font(.system(size: 16))
                
            }
            Spacer()
        }
        .background() {
            Image("ic_bg").resizable().aspectRatio(1.5, contentMode: .fill)
        }
        .glassBackgroundEffect(displayMode: .never)
        
    }
}

#Preview {
    LandingView()
}

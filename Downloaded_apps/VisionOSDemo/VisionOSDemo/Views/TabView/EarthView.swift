//
//  EarthView.swift
//  VisionOSDemo
//
//  Created by Ravi Jadav on 11/03/24.
//

import SwiftUI

struct EarthView: View {

    var body: some View {
        Text("EarchView")
//        GeometryReader { geometry in
//            VStack(alignment: .center) {
//                HStack(alignment: .center) {
//                    Image(systemName: "magnifyingglass")
//                        .frame(width: 28, height: 28)
//                        .background(.theme4FB400)
//                        .clipShape(.rect(cornerRadius: 3))
//                    
//                    
//                    HStack{
//                        TextField("", text: $name, prompt: Text("Search") .foregroundColor(.white))
//                            .font(.system(size: 12))
//                            .textFieldStyle(.plain)
//                            .controlSize(.large)
//                            .padding()
//                            .foregroundColor(.white)
//                            .tint(.white)
//                            .hoverEffectDisabled()
//                        
//                    }
//                    .frame(width: geometry.size.width * 0.5, height: 28)
//                    .background(Color(.theme343434).clipShape(RoundedRectangle(cornerRadius:3)))
//                    .padding(.horizontal, 10)
//                    
//                }
////                .position(CGPoint(x: geometry.size.width / 2, y: 20))
//                .padding()
//                                                
//                VStack(alignment: .leading) {
//                    Text("Upcoming Events")
//                        .font(.system(size: 15))
//                        .fontWeight(.medium)
//                        .padding(.horizontal, 40)
////                    HStack{
//                    ScrollView(.horizontal) {
//                        LazyHStack {
//                            ForEach(0...5, id: \.self) { index in
//                                CellEvent(viewWidth: geometry.size.width)
//                            }
//                            
//                            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
//                            
//                        }
//                        .padding(.horizontal, 40)
//                        
//                    }
//                    .background(.blue)
//                }
//                .frame(height: 220)
////                .background(.red)
//                
//                Spacer()
//                
////                HStack {
////                    Text("Upcoming Events")
////                        .font(.system(size: 15))
////                        .fontWeight(.medium)
////                    ScrollView(.horizontal) {
////                        
////                    }
////                }
////                .frame(height: 150)
////                .background(.red)
////                HStack {
////                    Text("Upcoming Events")
////                        .font(.system(size: 15))
////                        .fontWeight(.medium)
////                    ScrollView(.horizontal) {
////                        
////                    }
////                }
////                .background(.red)
//            }
//            .glassBackgroundEffect(displayMode: .always)
//        }
    }
}

#Preview {
    EarthView()
}

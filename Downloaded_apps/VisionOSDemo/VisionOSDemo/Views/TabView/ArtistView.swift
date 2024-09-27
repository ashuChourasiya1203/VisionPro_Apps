//
//  ArtistView.swift
//  VisionOSDemo
//
//  Created by Ravi Jadav on 13/03/24.
//

import SwiftUI

struct ArtistView: View {
    
    let layout = [
        GridItem(.fixed(40)),
        GridItem(.fixed(40)),
        GridItem(.fixed(40))
    ]
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack(alignment: .leading) {
                Image("Cover Photo")
                    .resizable()
                    .frame(height: 150)
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack{
                            Text("Jay Davies")
                                .font(.system(size: 22.5))
                                .padding(EdgeInsets(top: 3, leading: 35, bottom: 0, trailing: 15))
                        }
                        Text("@jaydavies")
                            .font(.system(size: 16))
                            .fontWeight(.regular)
                            .padding(EdgeInsets(top: 0, leading: 35, bottom: 3, trailing: 15))
                    }
                    .background(.black)
                    .clipShape(.rect(cornerRadius: 10))
                    .offset(y: -10)
                    .padding(.horizontal, 90)
                    
                    Spacer()
                    
                    VStack() {
                        HStack(content: {
                            VStack(content: {
                                Text("Subscribers")
                                    .fontWeight(.medium)
                                Text("88k")
                                    .fontWeight(.medium)
                            })
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                            Divider()
                                .frame(width: 2)
                                .overlay(.theme4FB400)
                                .clipShape(.rect(cornerRadius: 1))
                                .padding(EdgeInsets(top: 7, leading: 5, bottom: 7, trailing: 5))
                            VStack(content: {
                                Text("Subscribed to")
                                    .fontWeight(.medium)
                                Text("598")
                                    .fontWeight(.medium)
                            })
                            Button(action: {
                                
                            }, label: {
                                Text("Subscribe")
                                    .font(.system(size: 10))
                                    .fontWeight(.medium)
                                    .padding(EdgeInsets(top: 4, leading: 7, bottom: 4, trailing: 7))
                                
                            })
                            .buttonStyle(.plain)
                            .background(.theme4FB400)
                            .clipShape(.rect(cornerRadius: 3.75))
                            .frame(width: 100, height: 33)
                            
                        })
                    }
                    .frame(height: 50)
                    .background(.black)
                    .roundedCorner(10, corners: [.topLeft, .bottomLeft])
                    .offset(y: -10)
                }
                .frame(height: 0)
                .background(.blue)
                
                VStack(alignment: .leading){
                    Image("ic_profile")
                        .resizable()
                        .frame(width: 93, height: 93)
                        .offset(x: 15, y: -30)
                }
                .frame(height: 20)
                
                ScrollView(.vertical) {
                    LazyVGrid(columns: [
                        GridItem(.fixed(geometry.size.width * 0.3)),
                        GridItem(.fixed(geometry.size.width * 0.3)),
                        GridItem(.fixed(geometry.size.width * 0.3))
                    ], content: {
                        ForEach(0...15, id: \.self) { ind in
                            VStack {
                                Image("ic_event_place")
                                    .resizable()
                                    .clipped()
                                    .frame(width: geometry.size.width * 0.3, height: 180)
                                
                                
                                HStack(alignment: .top) {
                                    Image("ic_profile")
                                        .resizable()
                                        .frame(width: 28, height: 28)
                                    
                                    VStack(alignment: .leading) {
                                        
                                        Text("Arctic Echoes: The Maine Live")
                                            .lineLimit(1)
                                            .font(.system(size: 14))
                                            .frame(height: 9)
                                        Text("@themaineband")
                                            .frame(height: 9)
                                            .font(.system(size: 14))
                                        HStack {
                                            HStack {
                                                Image("ic_money")
                                                    .resizable()
                                                    .frame(width: 16, height: 16)
                                                Text("Free")
                                                    .font(.system(size: 14))
                                                
                                                Image("ic_heart")
                                                    .resizable()
                                                    .frame(width: 16, height: 16)
                                                Text("456")
                                                    .font(.system(size: 14))
                                                //                                                    Spacer()
                                            }
                                        }
                                    }
                                    
                                    
                                    Image(systemName: "ellipsis")
                                        .rotationEffect(.degrees(-90))
                                        .padding(EdgeInsets(top: 10, leading: 5, bottom: 0, trailing: -5))
                                    
                                }
                                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                                Spacer()
                            }
                            .onTapGesture {
                                
                            }
                            .frame(width: geometry.size.width * 0.3, height: 240)
                            .background(.theme0D0D0D)
                            .cornerRadius(11)
                        }
                    })
                }
                //                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                //                .background(.red)
            }
            .frame(minWidth: 1280, maxWidth: 1280, minHeight: geometry.size.height, maxHeight: geometry.size.height)
            .glassBackgroundEffect(displayMode: .always)
        }
        .uipNavigationBarHidden(true)
    }
}

#Preview {
    ArtistView()
}

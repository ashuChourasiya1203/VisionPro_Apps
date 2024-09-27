//
//  CellEvent.swift
//  VisionOSDemo
//
//  Created by Ravi Jadav on 12/03/24.
//

import SwiftUI

struct CellEvent: View {
    
    var viewWidth : CGFloat = 1000
    var image: String = "ic_event_place"
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .clipped()
                .frame(width: viewWidth * 0.29, height: 180)
            
            
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
        .frame(width: viewWidth * 0.29, height: 240)
        .background(.theme0D0D0D)
        .cornerRadius(11)
    }
}


struct CellArtist: View {
   
    var body: some View {
        HStack {
            Image("ic_profile")
                .resizable()
                .frame(width: 75, height: 75)
                .overlay {
                    RoundedRectangle(cornerRadius: 37.5)
                        .stroke(.black, lineWidth: 0.75)
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 18))
            VStack(alignment: .leading, spacing: 4) {
                Text("Reba")
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                Text("@reba")
                    .font(.system(size: 11))
                    .fontWeight(.medium)
                Text("134.5k followers  •  24 events")
                    .font(.system(size: 10))
                    .fontWeight(.regular)
                Button(action: {
                    
                }, label: {
                    Text("Subscribed")
                        .font(.system(size: 10))
                        .fontWeight(.medium)
                        .padding(EdgeInsets(top: 4, leading: 7, bottom: 4, trailing: 7))
                    
                })
                .buttonStyle(.plain)
                .background(.theme4FB400)
                .clipShape(.rect(cornerRadius: 3.75))
            }
        }
//        .background(.blue)
        
    }
    
}

#Preview {
    CellArtist()
}

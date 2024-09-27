//
//  EventView.swift
//  VisionOSDemo
//
//  Created by Ravi Jadav on 11/03/24.
//

import SwiftUI

struct EventView: View {
    
    @State private var name: String = ""
    @EnvironmentObject var router: UIPilot<AppRoute>
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                SearchContentView(geometry: geometry, name: self.name)
                ArticleEventView(geometry: geometry)
                
                VStack(alignment: .leading) {
                    Text("Your Favourit Artists")
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .padding(.horizontal, 40)
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(0...5, id: \.self) { index in
                                CellArtist().onTapGesture {
                                    self.router.push(.artistView)
                                }
                            }
                            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                        }
                        .padding(.horizontal, 40)
                    }
                }
                .frame(height: 130)
            }
            .glassBackgroundEffect(displayMode: .always)
        }
    }
}

#Preview {
    EventView()
}

struct SearchContentView: View {
    
    var geometry : GeometryProxy
    @State var name : String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .frame(width: 28, height: 28)
                .background(.theme4FB400)
                .clipShape(.rect(cornerRadius: 3))
            
            HStack{
                TextField("", text: $name, prompt: Text("Search") .foregroundColor(.white))
                    .font(.system(size: 12))
                    .textFieldStyle(.plain)
                    .controlSize(.large)
                    .padding()
                    .foregroundColor(.white)
                    .tint(.white)
                    .hoverEffectDisabled()
                
            }
            .frame(width: self.geometry.size.width * 0.5, height: 28)
            .background(Color(.theme343434).clipShape(RoundedRectangle(cornerRadius:3)))
            .padding(.horizontal, 10)
        }
        .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
    }
}

struct ArticleEventView : View {
    
    var geometry : GeometryProxy
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Upcoming Events")
                .font(.system(size: 15))
                .fontWeight(.medium)
                .padding(EdgeInsets(top: 0, leading: 40, bottom: 10, trailing: 0))
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(0...5, id: \.self) { index in
                        CellEvent(viewWidth: self.geometry.size.width)
                    }
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                }
                .padding(.horizontal, 40)
            }
        }
        .frame(height: 280)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
    }
}

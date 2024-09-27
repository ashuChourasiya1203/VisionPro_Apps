//
//  MissionArea.swift
//  InspirationSpace
//
//  Created by Ashutosh Chourasiya on 13/03/24.
//

import SwiftUI
import AVKit

struct MissionArea: View {
    
    @State var player = AVPlayer(url: Bundle.main.url(forResource: "Inspiration",withExtension: "mp4")!)
    @State var isPlaying: Bool = false
    
    var body: some View {
        VStack {
            VideoPlayer(player: self.player)
            Button {
                self.isPlaying ? self.player.pause() : self.player.play()
                self.isPlaying.toggle()
                self.player.seek(to: .zero)
            } label: {
                Image(systemName: self.isPlaying ? "stop" : "play").padding()
            }
            .padding(10)
        }
        .glassBackgroundEffect(displayMode: .implicit)
        .onAppear(perform: {
            self.isPlaying = false
        })
        .onDisappear(perform: {
            self.player.pause()
        })
    }
}

#Preview {
    MissionArea()
}

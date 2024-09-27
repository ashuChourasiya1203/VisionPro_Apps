//
//  CapsuleDetails.swift
//  InspirationSpace
//
//  Created by Apple on 14/03/24.
//

import SwiftUI

struct CapsuleDetails: View {
    
    @State private var orbitOn = false
    @State private var lightOn = true
    @State private var isShowing = false
    
    let turnOnLight: () -> Void
    let turnOffLight: ()  -> Void
    let turnOnOrbit: () -> Void
    let turnOffOrbit: ()  -> Void
    
    var body: some View {
        VStack {
            Button {
                self.isShowing.toggle()
            } label: {
                Label("Rocket Options", systemImage: "gear")
            }
            .controlSize(.mini)
            .font(.system(size: 15,weight: .black))
        }
        
        if self.isShowing {
            VStack {
                Text("The Dragon spacecraft is capable of carrying up to 7 passengers to and from Earth orbit, and beyond. It is the only spacecraft currently flying that is capable of returning significant amounts of cargo to Earth, and is the first private spacecraft to take humans to the space station.")
                    .font(.system(size: 8))
                
                HStack(alignment:.top) {
                    VStack(alignment:.leading) {
                        Toggle(isOn: self.$lightOn){
                            Text("Light \(!self.lightOn ? "Off" : "On")")
                                .font(.system(size: 8, weight:. bold))
                        }.onChange(of: self.lightOn, {
                            self.lightOn ? self.turnOnLight() : self.turnOffLight()
                        })
                    }
                    
                    VStack(alignment:.leading) {
                        Toggle(isOn: self.$orbitOn){
                            Text("Orbit \(!self.orbitOn ? "Off" : "On")")
                                .font(.system(size: 8, weight:. bold))
                        }.onChange(of: self.orbitOn, {
                            self.orbitOn ? self.turnOnOrbit() : self.turnOffOrbit()
                        })
                    }
                }
            }
            .padding(EdgeInsets(top: 5, leading: 25, bottom: 0, trailing: 25))
            .frame(width: 300, height: 120)
            .glassBackgroundEffect()
        }
    }
}

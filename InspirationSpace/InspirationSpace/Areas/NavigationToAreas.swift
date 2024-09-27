//
//  NavigationToAreas.swift
//  InspirationSpace
//
//  Created by Ashutosh Chourasiya on 13/03/24.
//

import SwiftUI

struct NavigationToAreas: View {
    var body: some View {
        VStack {
            Text("Welcome To Inspiration4 Mission By SpaceX")
                .monospaced()
                .font(.system(size: 40, weight: .bold))
                .padding(.top, 250)
            
            HStack(spacing: 25) {
                ForEach(Area.allCases) { area in
                    NavigationLink {
                        Text(area.title)
                            .monospaced()
                            .font(.system(size: 40, weight: .bold))
                        
                        if area == Area.astronauts {
                            CrewArea()
                        }else if area == Area.mission {
                            MissionArea()
                        }else if area == Area.equipment {
                            EquipmentArea()
                        }
                        Spacer()
                        
                    } label: {
                        Label(area.name, systemImage: "chevron.right")
                            .monospaced()
                            .font(.title)
                    }
                    .controlSize(.extraLarge)
                }
            }
        }
        .background() {
            Image(.inspiration4).scaledToFill()
        }
    }
}

#Preview {
    NavigationToAreas().environment(ViewModel())
}

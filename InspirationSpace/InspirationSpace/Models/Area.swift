//
//  Area.swift
//  InspirationSpace
//
//  Created by Ashutosh Chourasiya on 13/03/24.
//

import Foundation

enum Area : String,Identifiable,CaseIterable,Equatable {

    case astronauts,equipment,mission
    
    var id : Self { self }
    var name : String { self.rawValue.lowercased() }
    
    var title: String {
        switch self {
            case .astronauts:
                "Inspiration4 mission crew members..."
            case .equipment:
                "Inspiration4 mission equipment..."
            case .mission:
                "Inspiration4 mission trailer..."
        }
    }
}

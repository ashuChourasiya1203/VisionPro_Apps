//
//  ColorString.swift
//  MultipleWindows
//
//  Created by Apple on 19/03/24.
//

import SwiftUI

struct ColorString : Identifiable {
    var id : UUID
    var string : String
    var color : Color
    
    init(id: UUID, string: String, color: Color) {
        self.id = id
        self.string = string
        self.color = color
    }
    
}


class ColorStringViewModel {
    
    static var stub = [ ColorString(id:UUID(), string: "black", color: .black),
                        ColorString(id:UUID(), string: "blue", color: .blue),
                        ColorString(id:UUID(), string: "red", color: .red) ]
    
    var colorStrings : [ColorString] = stub
    
    subscript(colorStringId id : ColorString.ID) -> ColorString? {
        self.colorStrings.first(where: { $0.id == id})
    }
    
}

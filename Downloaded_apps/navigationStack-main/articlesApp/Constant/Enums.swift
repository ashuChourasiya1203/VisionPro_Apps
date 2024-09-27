//
//  Enums.swift
//  articlesApp
//
//  Created by Apple on 13/03/24.
//

import Foundation

enum Tab {
    case home, goals, settings
}

enum HomeNavigation: Hashable {
    case child, secondChild(Person)
}

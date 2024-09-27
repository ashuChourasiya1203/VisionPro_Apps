//
//  Enums.swift
//  TabViewApps
//
//  Created by Apple on 15/03/24.
//

import Foundation

enum GameAppTab {
    case play,more,tv,broadcast,list,search
}

enum HomeNavigation: Hashable {
    case child, secondChild(Person)
}

enum AppRoute: Equatable {
    
    static func == (lhs: AppRoute, rhs: AppRoute) -> Bool {
        return lhs.key == rhs.key
    }

    case landingView
    case registerView
    case homeview
    case artistView

    var key: String {
        switch self {
        case .landingView: return "landingView"
        case .registerView: return "registerView"
        case .homeview: return "homeview"
        case .artistView: return "artistView"
        }
    }
}

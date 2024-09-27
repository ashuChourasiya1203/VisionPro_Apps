//
//  Enum+Extensions.swift
//  VisionOSDemo
//
//  Created by Ravi Jadav on 08/03/24.
//

import Foundation
import SwiftUI

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

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, 
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

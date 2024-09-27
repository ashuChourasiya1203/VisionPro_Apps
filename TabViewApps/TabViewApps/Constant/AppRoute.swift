//
//  AppRoute.swift
//  TabViewApps
//
//  Created by Apple on 15/03/24.
//

import SwiftUI

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: self.corners,
                                cornerRadii: CGSize(width: self.radius, height: self.radius))
        return Path(path.cgPath)
    }
}

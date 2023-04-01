//
//  Colors.swift
//  StateShizzle
//
//  Created by Stepan Vardanyan on 01.04.23.
//

import SwiftUI

enum ColorName: String {
    case accentColor
    case deepGreen
    case deepPurple
    case orangeRed
    case `none`
}

extension Color {

    init(_ name: ColorName) {
        if name == .accentColor {
            self.init("AccentColor")
        } else {
            self.init(name.rawValue)
        }
    }
}

extension Color {

    static let deepGreen: Color = .init(.deepGreen)
    static let deepPurple: Color = .init(.deepPurple)
    static let orangeRed: Color = .init(.orangeRed)

    var name: ColorName {
        switch self {
        case .deepGreen:
            return .deepGreen
        case .deepPurple:
            return .deepPurple
        case .orangeRed:
            return .orangeRed
        default:
            return .none
        }
    }
}

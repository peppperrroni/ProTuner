//
//  Font+Ext.swift
//  ProTuner
//
//  Created by Yuriy Egorov on 1/31/25.
//

import SwiftUI

public enum LatoFont: String {
    case black = "Lato-Black"
    case blackItalic = "Lato-BlackItalic"
    case bold = "Lato-Bold"
    case boldItalic = "Lato-BoldItalic"
    case hairline = "Lato-Hairline"
    case hairlineItalic = "Lato-HairlineItalic"
    case italic = "Lato-Italic"
    case light = "Lato-Light"
    case lightItalic = "Lato-LightItalic"
    case regular = "Lato-Regular"
}

public extension Font {
    static func lato(_ font: LatoFont = .regular, size: CGFloat) -> Font {
        return Self.custom(font.rawValue, size: size)
    }
    
    static func lato(_ font: LatoFont = .regular, fixedSize: CGFloat) -> Font {
        return Self.custom(font.rawValue, fixedSize: fixedSize)
    }
    
    static func lato(_ font: LatoFont = .regular, size: CGFloat, relativeTo: TextStyle) -> Font {
        return Self.custom(font.rawValue, size: size, relativeTo: relativeTo)
    }
}

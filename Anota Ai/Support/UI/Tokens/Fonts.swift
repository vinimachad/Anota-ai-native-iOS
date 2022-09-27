//
//  Fonts.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/08/22.
//

import Foundation
import UIKit
import SwiftUI

extension UIFont {
    
    enum FontType: String {
        case regular = "Roboto-Regular"
        case bold = "Roboto-Bold"
        case medium = "Roboto-Medium"
    }
    
    static func `default`(type: FontType, ofSize size: CGFloat = UIFont.labelFontSize) -> UIFont {
        guard let font = UIFont(name: type.rawValue, size: size) else {
            fatalError("Font \(type.rawValue) is not in the project")
        }
        
        return font
    }
}

extension Font {
    
    static func `default`(type: UIFont.FontType, ofSize size: CGFloat = UIFont.labelFontSize) -> Font {
        return Font.custom(type.rawValue, size: size)
    }
}

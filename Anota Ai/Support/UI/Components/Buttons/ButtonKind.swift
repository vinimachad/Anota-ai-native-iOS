//
//  ButonKind.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 11/08/22.
//

import Foundation
import UIKit

extension ButtonKit {
    
    enum ButtonKind {
        case primary
        case outlined
        case confirm
        case cancel
        
        var backgroundColor: UIColor {
            switch self {
            case .primary, .confirm: return .Brand.primary
            case .outlined, .cancel: return .Shapes.shape
            }
        }
        
        var titleColor: UIColor {
            switch self {
            case .primary, .confirm: return .Shapes.shape
            case .outlined, .cancel: return .Texts.heading
            }
        }
        
        var borderColor: UIColor {
            switch self {
            case .outlined, .cancel: return .Shapes.stroke
            default: return .clear
            }
        }
    }
}

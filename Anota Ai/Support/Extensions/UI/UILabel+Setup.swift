//
//  UILabel+Setup.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 13/08/22.
//

import Foundation
import UIKit

extension UILabel {
    
    func setupLabel(type: UIFont.FontType = .regular, size: CGFloat, color: UIColor = .Texts.body) {
        self.font = .default(type: type, ofSize: size)
        self.textColor = color
        self.numberOfLines = 0
    }
}

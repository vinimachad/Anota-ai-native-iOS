//
//  Button.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 04/08/22.
//

import Foundation
import UIKit

class Button: UIButton {
    
    // MARK: - Computed properties
    
    var title: String? {
        get { titleLabel?.text }
        set {
            setTitle(newValue, for: .normal)
            setTitle(newValue, for: .disabled)
        }
    }
    
    var titleColor: UIColor? {
        get { titleLabel?.textColor }
        set {
            setTitleColor(newValue, for: .normal)
            setTitleColor(newValue, for: .disabled)
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension Button {
    
    private func setup() {
        layer.cornerRadius = 48 / 2
        titleLabel?.font = .default(type: .bold)
    }
}

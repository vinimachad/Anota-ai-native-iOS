//
//  Button.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 04/08/22.
//

import Foundation
import UIKit

class ButtonKit: UIButton {
    
    // MARK: - Computed properties
    
    var onTapButton: (() -> Void)?
    
    var kind: ButtonKind = .primary {
        didSet {
            updateByKind()
        }
    }
    
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
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                alpha = 1
                return
            }
            alpha = 0.4
        }
    }
    
    // MARK: - Init
    
    init(title: String?, kind: ButtonKind = .confirm, onTapButton: (() -> Void)? = nil) {
        self.onTapButton = onTapButton
        self.kind = kind
        super.init(frame: .zero)
        self.title = title
        setup()
        updateByKind()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup methods
    
    func setBorder(color: UIColor) {
        layer.borderColor = color.cgColor
        layer.borderWidth = 1
    }
}

// MARK: - Setup

extension ButtonKit {
    
    private func setup() {
        layer.cornerRadius = 48 / 2
        titleLabel?.font = .default(type: .bold)
        addTarget(self, action: #selector(didTapButton), for: .touchDown)
    }
    
    private func updateByKind() {
        setBorder(color: kind.borderColor)
        titleColor = kind.titleColor
        backgroundColor = kind.backgroundColor
    }
    
    @objc private func didTapButton() {
        onTapButton?()
    }
}

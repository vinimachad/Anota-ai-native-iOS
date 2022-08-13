//
//  TextField.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 12/08/22.
//

import Foundation
import UIKit
import SkyFloatingLabelTextField

class TextField: SkyFloatingLabelTextField {

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

    // MARK: - Setup methods

    func setTitle(_ title: String) {
        placeholder = title
        selectedTitle = title
    }
}

// MARK: - Setup

extension TextField {

    private func setup() {
        lineColor = .Shapes.stroke
        selectedLineColor = .Shapes.stroke
        selectedLineHeight = 1
        selectedTitleColor = .Texts.heading
        textColor = .Texts.body
    }
}

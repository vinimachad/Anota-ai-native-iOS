//
//  DimmingView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 09/08/22.
//

import Foundation
import UIKit
import SnapKit

class DimmingView: UIView {
    
    // MARK: - Public properties
    
    var onDismissPresentation: (() -> Void)?
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup view

extension DimmingView {
    
    private func setup() {
        setupConstraints()
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .black
        alpha = 0.5
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didDismissPresentation)))
    }
    
    @objc private func didDismissPresentation() {
        onDismissPresentation?()
    }
}

// MARK: - Setup constraints

extension DimmingView {
    
    private func setupConstraints() {
        viewHierarchy()
    }
    
    private func viewHierarchy() {
        
    }
}


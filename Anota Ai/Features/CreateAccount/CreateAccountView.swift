//
//  CreateAccountView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 13/08/22.
//

import Foundation
import UIKit
import SnapKit

protocol CreateAccountViewModelProtocol {}

class CreateAccountView: UIView {
    
    // MARK: - UI Components
    
    // MARK: - Private properties
    
    private var viewModel: CreateAccountViewModelProtocol?
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Bind
    
    func bindIn(viewModel: CreateAccountViewModelProtocol) {
        self.viewModel = viewModel
    }
}

// MARK: - Setup view

extension CreateAccountView {
    
    private func setup() {
        setupConstraints()
        backgroundColor = .blue
    }
}

// MARK: - Setup constraints

extension CreateAccountView {
    
    private func setupConstraints() {
        viewHierarchy()
    }
    
    private func viewHierarchy() {
        
    }
}


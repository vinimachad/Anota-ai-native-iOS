//
//  LoginView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 19/08/22.
//

import Foundation

import UIKit
import SnapKit

protocol LoginViewModelProtocol {}

class LoginView: UIView {
    
    // MARK: - UI Components
    
    // MARK: - Private properties
    
    private var viewModel: LoginViewModelProtocol?
    
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
    
    func bindIn(viewModel: LoginViewModelProtocol) {
        self.viewModel = viewModel
    }
}

// MARK: - Setup view

extension LoginView {
    
    private func setup() {
        setupConstraints()
    }
}

// MARK: - Setup constraints

extension LoginView {
    
    private func setupConstraints() {
        viewHierarchy()
    }
    
    private func viewHierarchy() {
        
    }
}


//
//  ConfirmLocationView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 12/08/22.
//

import Foundation

import UIKit
import SnapKit

protocol ConfirmLocationViewModelProtocol {}

class ConfirmLocationView: UIView {
    
    // MARK: - UI Components
    
    // MARK: - Private properties
    
    private var viewModel: ConfirmLocationViewModelProtocol?
    
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
    
    func bindIn(viewModel: ConfirmLocationViewModelProtocol) {
        self.viewModel = viewModel
    }
}

// MARK: - Setup view

extension ConfirmLocationView {
    
    private func setup() {
        setupConstraints()
        backgroundColor = .Shapes.box
    }
}

// MARK: - Setup constraints

extension ConfirmLocationView {
    
    private func setupConstraints() {
        viewHierarchy()
    }
    
    private func viewHierarchy() {
        
    }
}


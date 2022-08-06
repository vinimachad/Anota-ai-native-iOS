//
//  LoadingView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 06/08/22.
//

import Foundation

import UIKit
import SnapKit

class LoadingView: UIView {
    
    // MARK: - UI Components
    
    private lazy var loadingActivityIndicator = UIActivityIndicatorView()
    
    // MARK: - Private properties
    
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
    
    func bindIn() {
        
    }
}

// MARK: - Setup view

extension LoadingView {
    
    private func setup() {
        setupConstraints()
        setupLoadingActivityIndicator()
        backgroundColor = .Shapes.shape
    }
    
    private func setupLoadingActivityIndicator() {
        loadingActivityIndicator.style = .large
        loadingActivityIndicator.color = .Brand.primary
    }
    
    func startAnimatingActivityIndicator() {
        loadingActivityIndicator.startAnimating()
    }
    
    func stopAnimatingActivityIndicator() {
        loadingActivityIndicator.stopAnimating()
    }
}

// MARK: - Setup constraints

extension LoadingView {
    
    private func setupConstraints() {
        viewHierarchy()
        
        loadingActivityIndicator.snp.makeConstraints {
            $0.centerX.equalTo(snp.centerX)
            $0.centerY.equalTo(snp.centerY)
        }
    }
    
    private func viewHierarchy() {
        addSubview(loadingActivityIndicator)
    }
}


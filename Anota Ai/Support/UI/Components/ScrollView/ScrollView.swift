//
//  ScrollView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 12/08/22.
//

import Foundation
import UIKit
import SnapKit

class ScrollView: UIView {
    
    // MARK: - Private properties
    
    private lazy var scrollView: UIScrollView = UIScrollView()
    private var contentView: UIView
    
    // MARK: Init
    
    init(contentView: UIView) {
        self.contentView = contentView
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup view

extension ScrollView {
    
    private func setup() {
        setupConstraints()
        backgroundColor = .Shapes.shape
    }
}

// MARK: - Setup constraints

extension ScrollView {
    
    private func setupConstraints() {
        viewHierarchy()
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(snp.topMargin)
            $0.horizontalEdges.equalTo(snp.horizontalEdges)
            $0.bottom.equalTo(snp.bottomMargin)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.snp.edges)
            $0.centerX.equalTo(scrollView.snp.centerX)
            $0.centerY.equalTo(scrollView.snp.centerY)
        }
    }
    
    private func viewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
    }
}


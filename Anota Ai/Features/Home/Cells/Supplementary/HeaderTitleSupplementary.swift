//
//  HeaderTitleSupplementary.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 02/09/22.
//

import Foundation

import UIKit
import SnapKit
import CollectionDS_SDK
import Reusable

protocol HeaderTitleSupplementaryViewModelProtocol: SupplementaryViewModelProtocol {
    var title: String { get }
}

class HeaderTitleSupplementary: UICollectionReusableView, SupplementaryViewProtocol  {
    
    // MARK: - UI Components
    
    private lazy var titleLabel = UILabel()
    
    // MARK: - Private properties
    
    private var viewModel: HeaderTitleSupplementaryViewModelProtocol?
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindIn(viewModel: SupplementaryViewModelProtocol) {
        self.viewModel = viewModel as? HeaderTitleSupplementaryViewModelProtocol
        titleLabel.text = self.viewModel?.title
    }
    
}

// MARK: - Setup view

extension HeaderTitleSupplementary {
    
    private func setup() {
        setupConstraints()
        titleLabel.setupLabel(type: .bold, size: 16, color: .Texts.heading)
    }
}

// MARK: - Setup constraints

extension HeaderTitleSupplementary {
    
    private func setupConstraints() {
        viewHierarchy()
        
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(snp.left).offset(16)
            $0.top.equalTo(snp.top)
            $0.right.equalTo(snp.right).offset(-16)
            $0.bottom.equalTo(snp.bottom)
        }
    }
    
    private func viewHierarchy() {
        addSubview(titleLabel)
    }
}


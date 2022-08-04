//
//  ExplanationCell.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/08/22.
//

import Foundation
import UIKit
import CollectionDS_SDK
import SnapKit

protocol ExplanationCellViewModelProtocol: CollectionViewModelProtocol {}

class ExplanationCell: UICollectionViewCell, CollectionViewProtocol {
    
    // MARK: - UI Components
    
    private lazy var coverImageView = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var bodyLabel = UILabel()
    
    // MARK: - Private properties
    
    private var viewModel: ExplanationCellViewModelProtocol?
    
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
    
    func bindIn(viewModel: ExplanationCellViewModelProtocol) {
        self.viewModel = viewModel
    }
}

// MARK: - Setup view

extension ExplanationCell {
    
    private func setup() {
        setupConstraints()
        setupCoverImage()
        setupTitleLabel()
        setupBodyLabel()
    }
    
    private func setupCoverImage() {
        coverImageView.image = .Images.mobilePosts
        coverImageView.contentMode = .scaleAspectFit
    }
    
    private func setupTitleLabel() {
        titleLabel.text = "É você quem comanda"
        bodyLabel.numberOfLines = 0
    }
    
    private func setupBodyLabel() {
        bodyLabel.text = "Você controla todos seus pedidos e também consegue verificar os pedidos da sua mesa."
        bodyLabel.numberOfLines = 0
    }
}

// MARK: - Setup constraints

extension ExplanationCell {
    
    private func setupConstraints() {
        viewHierarchy()
        
        coverImageView.snp.makeConstraints {
            $0.centerX.equalTo(snp.centerX)
            $0.top.equalTo(snp.top)
            $0.height.equalTo(271)
        }
        
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(snp.leftMargin)
            $0.right.equalTo(snp.rightMargin)
            $0.top.equalTo(coverImageView.snp.bottom).offset(24)
        }

        bodyLabel.snp.makeConstraints {
            $0.left.equalTo(snp.leftMargin)
            $0.right.equalTo(snp.rightMargin)
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.bottom.equalTo(snp.bottomMargin)
        }
        
        print(bounds)
    }
    
    private func viewHierarchy() {
        addSubview(coverImageView)
        addSubview(titleLabel)
        addSubview(bodyLabel)
    }
}

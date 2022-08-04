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

protocol ExplanationCellViewModelProtocol: CollectionViewModelProtocol {
    var name: String { get set }
}

class ExplanationCell: UICollectionViewCell, CollectionViewProtocol {
    
    // MARK: - UI Components
    
    private lazy var coverImageView = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var bodyLabel = UILabel()
    
    // MARK: - Private properties
    
    private(set) var viewModel: ExplanationCellViewModelProtocol?
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
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
    
    static func size(width: CGFloat) -> CGSize {
        let padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let width = width - (padding.left + padding.right)
        return CGSize(width: width, height: 400)
    }
    
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
            $0.centerX.equalTo(contentView.snp.centerX)
            $0.top.equalTo(contentView.snp.top)
            $0.height.equalTo(271)
        }
        
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(contentView.snp.leftMargin)
            $0.right.equalTo(contentView.snp.rightMargin)
            $0.top.equalTo(coverImageView.snp.bottom).offset(24)
        }

        bodyLabel.snp.makeConstraints {
            $0.left.equalTo(contentView.snp.leftMargin)
            $0.right.equalTo(contentView.snp.rightMargin)
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.bottom.equalTo(contentView.snp.bottomMargin)
        }
    }
    
    private func viewHierarchy() {
        contentView.addSubview(coverImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(bodyLabel)
    }
}

//
//  RestaurantCell.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 02/09/22.
//

import UIKit
import Reusable
import CollectionDS_SDK
import SnapKit

protocol RestaurantCellViewModelProtocol: CollectionViewModelProtocol {}

class RestaurantCell: UICollectionViewCell, CollectionViewProtocol {
    
    // MARK: - UI Components
    
    private lazy var previewImageView = UIImageView()
    private lazy var titleLabel = UILabel()
    
    // MARK: - Private properties
    
    private var viewModel: RestaurantCellViewModelProtocol?
    
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
    
    func bindIn(viewModel: RestaurantCellViewModelProtocol) {
        self.viewModel = viewModel
    }
}

// MARK: - Setup view

extension RestaurantCell {
    
    private func setup() {
        setupConstraints()
        setupPreviewImageView()
        setupTitleLabel()
    }
    
    private func setupPreviewImageView() {
        previewImageView.layer.cornerRadius = 83.5/2
        previewImageView.layer.masksToBounds = false
        previewImageView.clipsToBounds = true
        previewImageView.contentMode = .scaleAspectFit
        previewImageView.backgroundColor = .red
    }
    
    private func setupTitleLabel() {
        titleLabel.text = "Madalena"
        titleLabel.setupLabel(type: .regular, size: 16, color: .Texts.body)
        titleLabel.textAlignment = .center
    }
}

// MARK: - Setup constraints

extension RestaurantCell {
    
    static func size(width: CGFloat) -> CGSize {
        return CGSize(width: width, height: 110)
    }
    
    static func sectionPadding() -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 16, bottom: 32, right: 16)
    }
    
    private func setupConstraints() {
        viewHierarchy()
        
        previewImageView.snp.makeConstraints {
            $0.height.equalTo(83.5)
            $0.horizontalEdges.equalTo(snp.horizontalEdges)
            $0.top.equalTo(snp.top)
            $0.bottom.equalTo(titleLabel.snp.top).offset(-6)
            $0.centerX.equalTo(0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.horizontalEdges.equalTo(snp.horizontalEdges)
            $0.bottom.equalTo(snp.bottom)
            $0.centerX.equalTo(0)
        }
    }
    
    private func viewHierarchy() {
        addSubview(previewImageView)
        addSubview(titleLabel)
    }
}


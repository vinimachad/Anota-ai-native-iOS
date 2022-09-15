//
//  AddressCardCell.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 13/08/22.
//

import Foundation
import UIKit
import Reusable
import CollectionDS_SDK
import SnapKit

protocol AddressCardCellViewModelProtocol: CollectionViewModelProtocol {
    var street: String { get }
    var city: String { get }
}

class AddressCardCell: UICollectionViewCell, CollectionViewProtocol {
    
    // MARK: - UI Components
    
    private lazy var titleLabel = UILabel()
    private lazy var subtitleLabel = UILabel()
    private lazy var streetLabel = UILabel()
    private lazy var cityLabel = UILabel()
    private lazy var changeButton = ButtonKit()
    
    // MARK: - Private properties
    
    private var viewModel: AddressCardCellViewModelProtocol?
    
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
    
    func bindIn(viewModel: AddressCardCellViewModelProtocol) {
        self.viewModel = viewModel
        
        streetLabel.text = viewModel.street
        cityLabel.text = viewModel.city
    }
}

// MARK: - Setup view

extension AddressCardCell {
    
    private func setup() {
        setupConstraints()
        setupTitleLabel()
        setupSubtitleLabel()
        setupStreetLabel()
        setupCityLabel()
        setupChangeButton()
        backgroundColor = .Shapes.shape
        layer.cornerRadius = 8
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = .zero
        layer.shadowRadius = 4
        layer.shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 4, width: bounds.width, height: bounds.height)).cgPath
    }
    
    private func setupTitleLabel() {
        titleLabel.text = "address_title".localize(.confirmLocation)
        titleLabel.setupLabel(type: .bold, size: 20, color: .Texts.heading)
    }
    
    private func setupSubtitleLabel() {
        subtitleLabel.text = "your_location_title".localize(.confirmLocation)
        subtitleLabel.setupLabel(type: .medium, size: 16, color: .Texts.heading)
    }
    
    private func setupStreetLabel() {
        streetLabel.setupLabel(size: 16)
    }
    
    private func setupCityLabel() {
        cityLabel.setupLabel(size: 16)
    }
    
    private func setupChangeButton() {}
}

// MARK: - Setup constraints

extension AddressCardCell {
    
    static func size(width: CGFloat) -> CGSize {
        let padding = sectionPadding()
        let width = width - (padding.left + padding.right)
        return CGSize(width: width, height: 150)
    }
    
    static func sectionPadding() -> UIEdgeInsets {
        UIEdgeInsets(top: 24, left: 16, bottom: 42, right: 16)
    }
    
    private func setupConstraints() {
        viewHierarchy()
        
        titleLabel.snp.makeConstraints {
            $0.horizontalEdges.equalTo(contentView.snp.horizontalEdges).offset(16)
            $0.top.equalTo(contentView.snp.top).offset(16)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.horizontalEdges.equalTo(contentView.snp.horizontalEdges).offset(16)
            $0.top.equalTo(titleLabel.snp.bottom).offset(28)
        }
        
        streetLabel.snp.makeConstraints {
            $0.horizontalEdges.equalTo(contentView.snp.horizontalEdges).offset(16)
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(10)
        }
        
        cityLabel.snp.makeConstraints {
            $0.horizontalEdges.equalTo(contentView.snp.horizontalEdges).offset(16)
            $0.top.equalTo(streetLabel.snp.bottom).offset(4)
        }
    }
    
    private func viewHierarchy() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(streetLabel)
        addSubview(cityLabel)
    }
}

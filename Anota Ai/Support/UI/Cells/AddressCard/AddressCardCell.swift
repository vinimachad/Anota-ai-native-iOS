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

protocol AddressCardCellViewModelProtocol: CollectionViewModelProtocol {}

class AddressCardCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private lazy var titleLabel = UILabel()
    private lazy var subtitleLabel = UILabel()
    private lazy var streetLabel = UILabel()
    private lazy var cityLabel = UILabel()
    private lazy var changeButton = Button()
    
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
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
    }
    
    private func setupTitleLabel() {
        titleLabel.setupLabel(type: .bold, size: 20, color: .Texts.heading)
    }
    
    private func setupSubtitleLabel() {
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
    
    private func setupConstraints() {
        viewHierarchy()
        
        
    }
    
    private func viewHierarchy() {
        
    }
}

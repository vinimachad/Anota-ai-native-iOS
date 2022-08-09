//
//  AlertView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 08/08/22.
//

import Foundation
import UIKit
import SnapKit

protocol AlertViewModelProtocol { }

class AlertView: UIView {
    
    // MARK: - UI Components
    
    private lazy var titleLabel = UILabel()
    private lazy var descriptionLabel = UILabel()
    private lazy var containerButtonsStackView = UIStackView()
    private lazy var confirmButton = Button()
    private lazy var cancelButton = Button()
    
    // MARK: - Private properties
    
    private var viewModel: AlertViewModelProtocol?
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindIn(viewModel: AlertViewModelProtocol) {
        self.viewModel = viewModel
    }
}

// MARK: - Setup view

extension AlertView {
    
    private func setup() {
        setupConstraints()
        setupTitleLabel()
        setupDescriptionLabel()
        setupContainerButtonsStackView()
        setupConfirmButton()
        setupCancelButton()
        backgroundColor = .Shapes.shape
        layer.cornerRadius = 8
    }
    
    private func setupTitleLabel() {
        titleLabel.text = "teste"
        titleLabel.font = .default(type: .bold, ofSize: 19)
        titleLabel.textColor = .Texts.heading
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
    }
    
    private func setupDescriptionLabel() {
        descriptionLabel.text = "description"
        descriptionLabel.font = .default(type: .regular, ofSize: 14)
        descriptionLabel.textColor = .Texts.body
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 3
    }
    
    private func setupContainerButtonsStackView() {
        containerButtonsStackView.distribution = .equalSpacing
        containerButtonsStackView.axis = .vertical
        containerButtonsStackView.alignment = .center
        containerButtonsStackView.spacing = 3
    }
    
    private func setupConfirmButton() {
        confirmButton.title = "Confirmar"
        confirmButton.titleColor = .Shapes.shape
        confirmButton.backgroundColor = .Brand.primary
    }
    
    private func setupCancelButton() {
        cancelButton.title = "Cancelar"
        cancelButton.titleColor = .Texts.heading
        cancelButton.backgroundColor = .Shapes.shape
        cancelButton.setBorder(color: .Shapes.stroke)
    }
}

// MARK: - Setup constraints

extension AlertView {
    
    private func setupConstraints() {
        viewHierarchy()
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(snp.top).offset(27)
            $0.left.equalTo(snp.left).offset(16)
            $0.right.equalTo(snp.right).offset(-16)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.left.equalTo(snp.left).offset(16)
            $0.right.equalTo(snp.right).offset(-16)
        }
        
        containerButtonsStackView.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo(descriptionLabel.snp.bottom).offset(16)
            $0.left.equalTo(snp.left).offset(16)
            $0.right.equalTo(snp.right).offset(-16)
            $0.bottom.equalTo(snp.bottom).offset(-27)
        }
        
        confirmButton.snp.makeConstraints {
            $0.left.equalTo(containerButtonsStackView.snp.left)
            $0.right.equalTo(containerButtonsStackView.snp.right)
            $0.bottom.equalTo(cancelButton.snp.top).offset(-16)
            $0.height.equalTo(48)
        }
        
        cancelButton.snp.makeConstraints {
            $0.left.equalTo(containerButtonsStackView.snp.left)
            $0.right.equalTo(containerButtonsStackView.snp.right)
            $0.height.equalTo(48)
        }
    }
    
    private func viewHierarchy() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(containerButtonsStackView)
        containerButtonsStackView.addArrangedSubview(confirmButton)
        containerButtonsStackView.addArrangedSubview(cancelButton)
    }
}


//
//  CreateAccountView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 13/08/22.
//

import Foundation
import UIKit
import SnapKit
import CollectionDS_SDK

protocol CreateAccountViewModelProtocol {
    var sections: [CollectionSectionProtocol] { get }
    var onButtonStateIsEnable: ((Bool) -> Void)? { get set }
    func didCreateAccount()
}

class CreateAccountView: UIView {
    
    // MARK: - UI Components
    
    private lazy var collectionViewFlowLayout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
    private lazy var createAccountButton = Button()
    
    // MARK: - Private properties
    
    private var viewModel: CreateAccountViewModelProtocol?
    private var collectionViewDataSource = CollectionViewDataSource()
    
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
    
    func bindIn(viewModel: CreateAccountViewModelProtocol) {
        self.viewModel = viewModel
        collectionViewDataSource.sections = viewModel.sections
        
        self.viewModel?.onButtonStateIsEnable = { [weak self] isEnable in
            self?.createAccountButton.isEnabled = isEnable
        }
    }
}

// MARK: - Setup view

extension CreateAccountView {
    
    private func setup() {
        setupConstraints()
        setupCollectionView()
        setupCreateAccountButton()
        backgroundColor = .Shapes.shape
    }
    
    private func setupCollectionView() {
        collectionViewDataSource.collectionView = collectionView
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .Shapes.shape
    }
    
    private func setupCreateAccountButton() {
        createAccountButton.title = "Criar conta"
        createAccountButton.kind = .primary
        createAccountButton.isEnabled = false
        createAccountButton.addTarget(self, action: #selector(didCreateAccount), for: .touchDown)
    }
    
    @objc private func didCreateAccount() {
        viewModel?.didCreateAccount()
    }
}

// MARK: - Setup constraints

extension CreateAccountView {
    
    private func setupConstraints() {
        viewHierarchy()
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(snp.topMargin)
            $0.horizontalEdges.equalTo(snp.horizontalEdges)
        }
        
        createAccountButton.snp.makeConstraints {
            $0.left.equalTo(16)
            $0.right.equalTo(-16)
            $0.top.lessThanOrEqualTo(collectionView.snp.bottom).offset(16)
            $0.bottom.equalTo(snp.bottomMargin)
            $0.height.equalTo(48)
        }
    }
    
    private func viewHierarchy() {
        addSubview(collectionView)
        addSubview(createAccountButton)
    }
}


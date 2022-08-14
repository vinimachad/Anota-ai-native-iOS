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
}

class CreateAccountView: UIView {
    
    // MARK: - UI Components
    
    private lazy var collectionViewFlowLayout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
    
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
    }
}

// MARK: - Setup view

extension CreateAccountView {
    
    private func setup() {
        setupConstraints()
        setupCollectionView()
        backgroundColor = .Shapes.shape
    }
    
    private func setupCollectionView() {
        collectionViewDataSource.collectionView = collectionView
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .Shapes.shape
        collectionView.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 24, right: 0)
    }
}

// MARK: - Setup constraints

extension CreateAccountView {
    
    private func setupConstraints() {
        viewHierarchy()
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(snp.topMargin)
            $0.horizontalEdges.equalTo(snp.horizontalEdges)
            $0.bottom.equalTo(snp.bottomMargin)
        }
    }
    
    private func viewHierarchy() {
        addSubview(collectionView)
    }
}


//
//  BaseCollectionView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 02/09/22.
//

import Foundation
import UIKit
import SnapKit
import CollectionDS_SDK

class BaseCollectionView: UIView {
    
    // MARK: - Public properties
    
    var setScrollDirection: UICollectionView.ScrollDirection {
        get { collectionViewFlowLayout.scrollDirection }
        set { collectionViewFlowLayout.scrollDirection = newValue }
    }
    
    // MARK: - UI Components
    
    private(set) lazy var collectionViewFlowLayout = UICollectionViewFlowLayout()
    private(set) lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
    
    // MARK: - Private properties
    
    private(set) var collectionViewDataSource = CollectionViewDataSource()
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup view

extension BaseCollectionView {
    
    private func setup() {
        setupConstraints()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionViewDataSource.collectionView = collectionView
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .Shapes.shape
    }
}

// MARK: - Setup constraints

extension BaseCollectionView {
    
    private func setupConstraints() {
        viewHierarchy()
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(snp.topMargin)
            $0.horizontalEdges.equalTo(snp.horizontalEdges)
        }
    }
    
    private func viewHierarchy() {
        addSubview(collectionView)
    }
}


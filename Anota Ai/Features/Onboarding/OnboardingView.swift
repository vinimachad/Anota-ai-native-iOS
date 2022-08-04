//
//  OnboardingView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/08/22.
//

import Foundation
import UIKit
import SnapKit
import CollectionDS_SDK

protocol OnboardingViewModelProtocol {}

class OnboardingView: UIView {
    
    // MARK: - UI Components

    private lazy var collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: UICollectionViewFlowLayout())
    
    // MARK: - Private properties
    
    private var viewModel: OnboardingViewModelProtocol?
    private var collectionDataSource = CollectionViewDataSource()
    
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
    
    func bindIn(viewModel: OnboardingViewModelProtocol) {
        self.viewModel = viewModel
        
        collectionDataSource.sections = [
            CollectionSection<ExplanationCell>(
                items: [
                    ExplanationCellViewModel(),
                    ExplanationCellViewModel()
                ],
                size: CGSize(width: 400, height: 400)
            )
        ]
    }
}

// MARK: - Setup view

extension OnboardingView {
    
    private func setup() {
        setupConstraints()
        setupCollectionView()
        backgroundColor = .Shapes.shape
    }
    
    private func setupCollectionView() {
        collectionDataSource.collectionView = collectionView
    }
}

// MARK: - Setup constraints

extension OnboardingView {
    
    private func setupConstraints() {
        viewHierarchy()
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(snp.topMargin)
            $0.left.equalTo(snp.left)
            $0.right.equalTo(snp.right)
            $0.bottom.equalTo(snp.bottomMargin)
        }
    }
    
    private func viewHierarchy() {
        addSubview(collectionView)
    }
}


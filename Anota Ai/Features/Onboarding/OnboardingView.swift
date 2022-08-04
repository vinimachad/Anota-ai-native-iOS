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

protocol OnboardingViewModelProtocol {
    var sections: [CollectionSectionProtocol] { get }
}

class OnboardingView: UIView {
    
    // MARK: - UI Components

    private lazy var collectionViewFlowLayout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
    private lazy var pageControl = UIPageControl()
    
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
        
        collectionDataSource.sections = viewModel.sections
    }
}

// MARK: - Setup view

extension OnboardingView {
    
    private func setup() {
        setupConstraints()
        setupCollectionView()
        setupPageControl()
        backgroundColor = .Shapes.shape
    }
    
    private func setupCollectionView() {
        collectionDataSource.collectionView = collectionView
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
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
        }
        
        pageControl.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(22)
            $0.left.equalTo(snp.leftMargin)
            $0.bottom.equalTo(snp.bottomMargin )
        }
    }
    
    private func viewHierarchy() {
        addSubview(collectionView)
        addSubview(pageControl)
    }
}

extension OnboardingView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? ExplanationCell {
            print(cell.viewModel?.name)
        }
    }
}

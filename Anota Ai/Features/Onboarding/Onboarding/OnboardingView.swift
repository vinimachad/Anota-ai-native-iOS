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
    var onExplanationWillDisplay: ((IndexPath) -> Void)? { get set }
}

class OnboardingView: UIView {
    
    // MARK: - UI Components
    
    private lazy var collectionViewFlowLayout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
    private lazy var pageControl = UIPageControl()
    private lazy var signUpButton = Button()
    private lazy var loginButton = Button()
    
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
        
        self.viewModel?.onExplanationWillDisplay = { [weak self] index in
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
                self?.pageControl.currentPage = index.row
            }
        }
    }
}

// MARK: - Setup view

extension OnboardingView {
    
    private func setup() {
        setupConstraints()
        setupCollectionView()
        setupPageControl()
        setupSignUpButton()
        setupLoginButton()
        backgroundColor = .Shapes.shape
    }
    
    private func setupCollectionView() {
        collectionDataSource.collectionView = collectionView
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .Shapes.shape
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .Shapes.stroke
        pageControl.currentPageIndicatorTintColor = .Brand.primary
        pageControl.backgroundStyle = .minimal
        pageControl.allowsContinuousInteraction = false
    }
    
    private func setupSignUpButton() {
        signUpButton.title = "Criar uma conta"
        signUpButton.titleColor = .Shapes.shape
        signUpButton.backgroundColor = .Brand.primary
    }
    
    private func setupLoginButton() {
        loginButton.title = "Entrar"
        loginButton.titleColor = .Shapes.shape
        loginButton.backgroundColor = .Brand.secondary
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
            $0.height.equalTo(500)
        }
        
        pageControl.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom)
            $0.left.equalTo(snp.left).offset(16)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(pageControl.snp.bottom).offset(54)
            $0.left.equalTo(snp.left).offset(16)
            $0.right.equalTo(snp.right).offset(-16)
            $0.height.equalTo(48)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(signUpButton.snp.bottom).offset(24)
            $0.left.equalTo(snp.left).offset(16)
            $0.right.equalTo(snp.right).offset(-16)
            $0.bottom.equalTo(snp.bottomMargin)
            $0.height.equalTo(48)
        }
    }
    
    private func viewHierarchy() {
        addSubview(collectionView)
        addSubview(pageControl)
        addSubview(signUpButton)
        addSubview(loginButton)
    }
}

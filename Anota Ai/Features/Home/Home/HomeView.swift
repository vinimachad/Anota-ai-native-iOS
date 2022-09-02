//
//  HomeView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 02/09/22.
//

import Foundation

import UIKit
import SnapKit
import CollectionDS_SDK

protocol HomeViewModelProtocol {
    var sections: [CollectionSectionProtocol] { get }
}

class HomeView: BaseCollectionView {
    
    // MARK: - UI Components
    
    // MARK: - Private properties
    
    private var viewModel: HomeViewModelProtocol?
    
    // MARK: - Bind
    
    func bindIn(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        collectionViewDataSource.sections = viewModel.sections
    }
}

// MARK: - Setup view

extension HomeView {
    
    private func setup() {
        setupConstraints()
    }
}

// MARK: - Setup constraints

extension HomeView {
    
    private func setupConstraints() {
        viewHierarchy()
    }
    
    private func viewHierarchy() {
        
    }
}


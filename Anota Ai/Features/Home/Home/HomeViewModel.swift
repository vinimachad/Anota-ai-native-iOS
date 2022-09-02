//
//  HomeViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 02/09/22.
//

import Foundation
import CollectionDS_SDK


protocol HomeProtocol: HomeViewModelProtocol {
    
}

class HomeViewModel {
    
    // MARK: - Public properties
    
    lazy var sections: [CollectionSectionProtocol] = {
        homeSectionBuilder.builder()
    }()
    
    // MARK: - Private properties
    
    private lazy var homeSectionBuilder = HomeBuilderSection()
    
    // MARK: - Init
    
    init() {
        
    }
}

// MARK: - HomeProtocol

extension HomeViewModel: HomeProtocol {
    
}

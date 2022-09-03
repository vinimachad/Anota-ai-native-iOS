//
//  HomeViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 02/09/22.
//

import Foundation
import CollectionDS_SDK


protocol HomeProtocol: HomeViewModelProtocol {
    func findRestaurantsRequest()
}



class HomeViewModel {
    
    // MARK: - Public properties
    
    var onUpdateSections: (([CollectionSectionProtocol]) -> Void)?
    
    // MARK: - Private properties
    
    private var homeSectionBuilder: HomeBuilderSectionProtocol = HomeBuilderSection()
    private var findRestaurantsUseCase: FindRestaurantsUseCaseProtocol
    
    // MARK: - Init
    
    init(findRestaurantsUseCase: FindRestaurantsUseCaseProtocol) {
        self.findRestaurantsUseCase = findRestaurantsUseCase
    }
}

// MARK: - HomeProtocol

extension HomeViewModel: HomeProtocol {
    
    func findRestaurantsRequest() {
        
        findRestaurantsUseCase.execute(
            success: { [weak self] restaurants in
                self?.homeSectionBuilder.appendRestaurantSection(with: restaurants)
                self?.onUpdateSections?(self?.homeSectionBuilder.builder() ?? [])
            },
            failure: { [weak self] message in
                
            }
        )
    }
}

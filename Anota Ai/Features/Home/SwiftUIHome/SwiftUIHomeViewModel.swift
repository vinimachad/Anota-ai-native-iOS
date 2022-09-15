//
//  SwiftUIHomeViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/09/22.
//

import Foundation

class SwiftUIHomeViewModel: ObservableObject {
    
    // MARK: - Public properties
    
    @Published var restaurants: [Restaurant] = []
    
    // MARK: - Private properties
    
    private var findRestaurantsUseCase: FindRestaurantsUseCaseProtocol
    
    // MARK: - Init
    
    init(findRestaurantsUseCase: FindRestaurantsUseCaseProtocol) {
        self.findRestaurantsUseCase = findRestaurantsUseCase
    }
    
    func findRestaurantsRequest() {
        
        findRestaurantsUseCase.execute(
            success: { [weak self] restaurants in
                self?.restaurants = restaurants
            },
            failure: { [weak self] message in
                
            }
        )
    }
}

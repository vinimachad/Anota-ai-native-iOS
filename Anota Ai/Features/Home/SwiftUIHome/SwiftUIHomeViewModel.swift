//
//  SwiftUIHomeViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/09/22.
//

import Foundation

class SwiftUIHomeViewModel: ObservableObject {
    
    @Published var restaurants: [Restaurant] = []
    
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

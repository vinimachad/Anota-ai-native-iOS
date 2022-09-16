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
    @Published var restaurantKinds: [RestaurantKind] = []
    
    // MARK: - Private properties
    
    private var findRestaurantsUseCase: FindRestaurantsUseCaseProtocol
    private var restaurantKindsUseCase: RestaurantKindsUseCaseProtocol
    private let semaphore = DispatchSemaphore(value: 0)
    
    // MARK: - Init
    
    init(findRestaurantsUseCase: FindRestaurantsUseCaseProtocol, restaurantKindsUseCase: RestaurantKindsUseCaseProtocol) {
        self.findRestaurantsUseCase = findRestaurantsUseCase
        self.restaurantKindsUseCase = restaurantKindsUseCase
    }
    
    func findRestaurantsRequest() {
        
        findRestaurantsUseCase.execute(
            success: { [weak self] restaurants in
                self?.restaurants = restaurants
                self?.semaphore.signal()
            },
            failure: { [weak self] message in
                self?.semaphore.signal()
            }
        )
    }
    
    func restaurantKindsRequest() {
        
        restaurantKindsUseCase.execute(
            success: { [weak self] kinds in
                self?.restaurantKinds = kinds
                self?.semaphore.signal()
            }
            ,failure: { error in
                self.semaphore.signal()
            }
        )
    }
    
    func callRequests() {
        DispatchQueue.global(qos: .background).async {
            self.findRestaurantsRequest()
            self.semaphore.wait()
            
            self.restaurantKindsRequest()
            self.semaphore.wait()
        }
    }
}

//
//  SwiftUIHomeViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/09/22.
//

import Foundation

class SwiftUIHomeViewModel: ObservableObject {
    
    // MARK: - Public properties
    
    @Published var restaurantKindsState: RequestState<[RestaurantKind]> = .loading
    @Published var restaurantState: RequestState<[Restaurant]> = .loading
    @Published var nearRestaurantState: RequestState<[Restaurant]> = .loading
    
    // MARK: - Private properties
    
    private var findRestaurantsUseCase: FindRestaurantsUseCaseProtocol
    private var restaurantKindsUseCase: RestaurantKindsUseCaseProtocol
    private var nearRestaurantsUseCase: NearRestaurantUseCase
    private let semaphore = DispatchSemaphore(value: 0)
    
    // MARK: - Init
    
    init(
        findRestaurantsUseCase: FindRestaurantsUseCaseProtocol,
        restaurantKindsUseCase: RestaurantKindsUseCaseProtocol,
        nearRestaurantsUseCase: NearRestaurantUseCase
    ) {
        self.findRestaurantsUseCase = findRestaurantsUseCase
        self.restaurantKindsUseCase = restaurantKindsUseCase
        self.nearRestaurantsUseCase = nearRestaurantsUseCase
    }
    
    func callRequests() {
        
        DispatchQueue.global(qos: .background).async {
            
            self.nearRestaurantsRequest()
            self.semaphore.wait()
            
            self.findRestaurantsRequest()
            self.semaphore.wait()
            
            self.restaurantKindsRequest()
            self.semaphore.wait()
        }
    }
}

// MARK: - Requests

extension SwiftUIHomeViewModel {
    
    private func nearRestaurantsRequest() {
        nearRestaurantsUseCase.execute(
            request: NearRequest(lat: "-20.4377741", long: "-54.6220197", maxDistance: 10),
            success: { [weak self] restaurants in
                self?.nearRestaurantState = .success(restaurants)
                self?.semaphore.signal()
            },
            failure: { [weak self] error in
                self?.nearRestaurantState = .failure(error.localizedDescription)
                self?.semaphore.signal()
            })
    }
    
    private func findRestaurantsRequest() {
        
        findRestaurantsUseCase.execute(
            success: { [weak self] restaurants in
                self?.restaurantState = .success(restaurants)
                self?.semaphore.signal()
            },
            failure: { [weak self] message in
                self?.restaurantState = .failure(message.localizedDescription)
                self?.semaphore.signal()
            }
        )
    }
    
    private func restaurantKindsRequest() {
        
        restaurantKindsUseCase.execute(
            success: { [weak self] kinds in
                self?.restaurantKindsState = .success(kinds)
                self?.semaphore.signal()
            }
            ,failure: { [weak self] error in
                self?.restaurantKindsState = .failure(error.localizedDescription)
                self?.semaphore.signal()
            }
        )
    }
}

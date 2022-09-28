//
//  RestaurantDetailViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 27/09/22.
//

import Foundation
import Combine

class RestaurantDetailViewModel: ObservableObject {
    
    // MARK: - Public properties
    
    @Published var restaurant: Restaurant
    @Published var reviews = [Review]()
    
    // MARK: - Private properties
    
    private var restaurantReviewsUseCase: any RestaurantReviewsUseCaseProtocol
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Init
    
    init(
        restaurant: Restaurant,
        restaurantReviewsUseCase: any RestaurantReviewsUseCaseProtocol
    ) {
        self.restaurantReviewsUseCase = restaurantReviewsUseCase
        self.restaurant = restaurant
    }
    
    func restaurantReviewsRequest() {
        restaurantReviewsUseCase.execute(request: restaurant.id)
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error): print(error)
                case .finished: break
                }
            }, receiveValue: { [unowned self] reviews in
                self.reviews = reviews
            })
            .store(in: &subscriptions)
    }
}

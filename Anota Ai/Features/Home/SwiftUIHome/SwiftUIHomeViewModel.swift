//
//  SwiftUIHomeViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/09/22.
//

import Foundation
import Combine

class SwiftUIHomeViewModel: ObservableObject {
    
    // MARK: - Public properties
    
    @Published var restaurantKindsState: RequestState<[RestaurantKind]> = .loading
    @Published var restaurantState: RequestState<[Restaurant]> = .loading
    @Published var nearRestaurantState: RequestState<[Restaurant]> = .loading
    @Published var bestRatedState: RequestState<[Restaurant]> = .loading
    @Published var filterIsInUse: Bool = false
    
    // MARK: - Private properties
    
    private var findRestaurantsUseCase: FindRestaurantsUseCaseProtocol
    private var restaurantKindsUseCase: RestaurantKindsUseCaseProtocol
    private var nearRestaurantsUseCase: NearRestaurantUseCase
    private var bestRatedRestaurantsUseCase: BestRatedRestaurantUseCase
    private let semaphore = DispatchSemaphore(value: 0)
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Init
    
    init(
        findRestaurantsUseCase: FindRestaurantsUseCaseProtocol,
        restaurantKindsUseCase: RestaurantKindsUseCaseProtocol,
        nearRestaurantsUseCase: NearRestaurantUseCase,
        bestRatedRestaurantsUseCase: BestRatedRestaurantUseCase
    ) {
        self.findRestaurantsUseCase = findRestaurantsUseCase
        self.restaurantKindsUseCase = restaurantKindsUseCase
        self.nearRestaurantsUseCase = nearRestaurantsUseCase
        self.bestRatedRestaurantsUseCase = bestRatedRestaurantsUseCase
    }
    
    func callRequests() {
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.restaurantKindsRequest()
            self?.semaphore.wait()
            
            self?.nearRestaurantsRequest()
            self?.semaphore.wait()
            
            self?.bestRatedRequest()
            self?.semaphore.wait()
            
            self?.findRestaurantsRequest()
            self?.semaphore.wait()
        }
    }
}

// MARK: - Requests

extension SwiftUIHomeViewModel {
    
    private func restaurantKindsRequest() {
        
        restaurantKindsUseCase.execute(
            success: { [weak self] kinds in
                guard let self else { return }
                self.isEmptyStateValidation(state: &self.restaurantKindsState, items: kinds)
                self.semaphore.signal()
            }
            ,failure: { [weak self] error in
                self?.restaurantKindsState = .failure(error.localizedDescription)
                self?.semaphore.signal()
            }
        )
    }
    
    private func nearRestaurantsRequest() {
        nearRestaurantsUseCase.execute(
            request: NearRequest(lat: "-20.4377741", long: "-54.6220197", maxDistance: 20),
            success: { [weak self] restaurants in
                guard let self else { return }
                self.isEmptyStateValidation(state: &self.nearRestaurantState, items: restaurants)
                self.semaphore.signal()
            },
            failure: { [weak self] error in
                self?.nearRestaurantState = .failure(error.localizedDescription)
                self?.semaphore.signal()
            })
    }
    
    private func bestRatedRequest() {
        bestRatedRestaurantsUseCase.execute()
            .sink(receiveCompletion: { [unowned self] result in
                switch result {
                case .finished: break
                case .failure(let error): bestRatedState = .failure(error.message)
                }
                self.semaphore.signal()
            }, receiveValue: { [unowned self] restaurants in
                self.isEmptyStateValidation(state: &bestRatedState, items: restaurants)
                self.semaphore.signal()
            })
            .store(in: &subscriptions)
    }
    
    private func findRestaurantsRequest() {
        
        findRestaurantsUseCase.execute(
            success: { [weak self] restaurants in
                guard let self else { return }
                self.isEmptyStateValidation(state: &self.restaurantState, items: restaurants)
                self.semaphore.signal()
            },
            failure: { [weak self] message in
                self?.restaurantState = .failure(message.localizedDescription)
                self?.semaphore.signal()
            }
        )
    }
    
    // MARK: - Private methods
    
    private func isEmptyStateValidation<T: Decodable>(state: inout RequestState<[T]>, items: [T]) {
        if items.isEmpty {
            state = .empty
            return
        }
        state = .success(items)
    }
}

//
//  MenuViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 30/09/22.
//

import Foundation
import Combine

class MenuViewModel: ObservableObject {
    
    // MARK: Public properties
    
    @Published var menuState: RequestState<[Food]> = .loading
    @Published var searchFood: String = ""
    
    // MARK: Private properties
    
    private var getMenuUseCase: any GetMenuUseCaseProtocol
    private var subscriptions = Set<AnyCancellable>()
    private var restaurant: Restaurant
    
    // MARK: Init
    
    init(getMenuUseCase: any GetMenuUseCaseProtocol, restaurant: Restaurant) {
        self.getMenuUseCase = getMenuUseCase
        self.restaurant = restaurant
    }
}

extension MenuViewModel {
    
    func getMenuRequest() {
        getMenuUseCase.execute(request: restaurant.id)
            .sink(
                receiveCompletion: { [unowned self] state in
                    switch state {
                    case .failure(let error): menuState = .failure(error.message)
                    case .finished: break
                    }
                },
                receiveValue: { [unowned self] menu in
                    isEmptyStateValidation(state: &menuState, items: menu.foods)
                }
            )
            .store(in: &subscriptions)
    }
}

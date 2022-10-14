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
    
    @Published var menuState: RequestState<[FoodSection]> = .loading
    @Published var searchFood: String = ""
    
    // MARK: Private properties
    
    private var getMenuUseCase: any GetMenuUseCaseProtocol
    private var subscriptions = Set<AnyCancellable>()
    private var restaurant: Restaurant
    private var foodTypes = [String]()
    private var foodSections = [FoodSection]()
    
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
                    mergeTypes(foods: menu.foods)
                }
            )
            .store(in: &subscriptions)
    }
    
    private func mergeTypes(foods: [Food]) {
        foods.forEach { food in
            if !foodTypes.contains(food.type) {
                foodTypes.append(food.type)
            }
        }
    
        foodTypes.forEach { type in
            let foods = foods.filter { $0.type == type }
            var section = FoodSection(title: type, foods: foods)
            
            if !foodSections.contains(where: { $0.title == section.title }) {
                foodSections.append(section)
            }
        }
        
        isEmptyStateValidation(state: &menuState, items: foodSections)
    }
}

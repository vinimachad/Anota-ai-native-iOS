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
    @Published var searchFoodState: RequestState<[Food]> = .empty
    @Published var searchFood: String = ""
    @Published var foodTypes = ["Todos"]
    @Published var selectedFood: String = "Todos"
    
    // MARK: Private properties
    
    private var getMenuUseCase: any GetMenuUseCaseProtocol
    private var subscriptions = Set<AnyCancellable>()
    private var restaurant: Restaurant
    private var foodSections = [FoodSection]()
    private var subscription = Set<AnyCancellable>()
    
    // MARK: Init
    
    init(getMenuUseCase: any GetMenuUseCaseProtocol, restaurant: Restaurant) {
        self.getMenuUseCase = getMenuUseCase
        self.restaurant = restaurant
        
        $searchFood
            .removeDuplicates()
            .map({ (string) -> String? in
                if string.count < 1 {
                    isEmptyStateValidation(state: &self.menuState, items: self.foodSections)
                    return nil
                }
                
                return string
            })
            .compactMap{ $0 }
            .sink { _ in
            } receiveValue: { [self] (searchField) in
                var foods = [Food]()
                
                foodSections.forEach {
                    let filteredFoods = $0.foods.filter {
                        $0.name.contains(searchField)
                    }
                    foods.append(contentsOf: filteredFoods)
                }
                
                isEmptyStateValidation(state: &searchFoodState, items: foods)
            }.store(in: &subscription)
    }
}

extension MenuViewModel {
    
    func foodIsSelected(_ type: String) -> Bool {
        selectedFood == type
    }
    
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
            let section = FoodSection(title: type, foods: foods)
            
            if !foodSections.contains(where: { $0.title == section.title }) {
                foodSections.append(section)
            }
        }
        
        isEmptyStateValidation(state: &menuState, items: foodSections)
    }
}

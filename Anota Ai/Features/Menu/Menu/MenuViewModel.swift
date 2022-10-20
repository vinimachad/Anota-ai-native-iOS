//
//  MenuViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 30/09/22.
//

import Foundation
import Combine
import SwiftUI

class MenuViewModel: ObservableObject {
    
    // MARK: Public properties
    
    @Published var menuState: RequestState<[FoodSection]> = .loading
    @Published var searchFoodState: RequestState<[Food]> = .empty
    @Published var searchFood: String = ""
    @Published var foodTypes = [String]()
    @Published var selectedFood: String = "Todos"
    @Published var searchBarIsHide: Bool = false
    
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
        
        self.searchFoodsPublisher()
        self.selectedFoodPublisher()
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
    
    func hideSearchBarValidation(with reader: GeometryProxy) {
        let yAxis = reader.frame(in: .global).minY
        
        if yAxis < 0 && !searchBarIsHide {
            
            DispatchQueue.main.async {
                withAnimation{ self.searchBarIsHide = true }
            }
        }
        
        if yAxis > 0 && searchBarIsHide {
            
            DispatchQueue.main.async {
                withAnimation{ self.searchBarIsHide = false }
            }
        }
    }
}

// MARK: - Methods to select section from segmented

extension MenuViewModel {
    
    private func selectedFoodPublisher() {
        $selectedFood
            .sink { [unowned self] selectedFood in
                self.showSelectedSectionValidation(with: selectedFood)
            }.store(in: &subscription)
    }
    
    private func showSelectedSectionValidation(with selectedSection: String) {
        if !foodSections.isEmpty {
            if selectedSection == "Todos" {
                showAllSections(with: selectedSection)
                return
            }
            showSelectedSection(with: selectedSection)
        }
    }
    
    private func showSelectedSection(with selectedSection: String) {
        let section = foodSections.filter { $0.title == selectedSection }
        menuState = .success(section)
    }
    
    private func showAllSections(with selectedSection: String) {
        isEmptyStateValidation(state: &menuState, items: foodSections)
    }
}

// MARK: - Methods to search foods

extension MenuViewModel {
    
    private func searchFoodsPublisher() {
        $searchFood
            .removeDuplicates()
            .map { searchValue -> String? in
                self.valueIsLessThanOneShowSections(searchValue: searchValue)
            }
            .compactMap { $0 }
            .sink { [unowned self] searchText in
                self.showSearchedFoods(with: searchText)
            }.store(in: &subscription)
    }
    
    private func valueIsLessThanOneShowSections(searchValue: String) -> String? {
        if searchValue.count < 1 {
            isEmptyStateValidation(state: &self.menuState, items: self.foodSections)
            return nil
        }
        
        return searchValue
    }
    
    private func showSearchedFoods(with searchText: String) {
        var foods = [Food]()
        
        foodSections.forEach {
            let filteredFoods = filterFoodsBySearch(with: $0.foods, searchText: searchText)
            foods.append(contentsOf: filteredFoods)
        }
        
        isEmptyStateValidation(state: &searchFoodState, items: foods)
    }
    
    private func filterFoodsBySearch(with foods: [Food], searchText: String) -> [Food] {
        foods.filter { $0.name.contains(searchText) }
    }
}

// MARK: Methods to generate Sections

extension MenuViewModel {
    
    private func mergeTypes(foods: [Food]) {
        appendIfFoodContainsFoodType(foods: foods)
        generateFoodSection(with: foods)
        isEmptyStateValidation(state: &menuState, items: foodSections)
    }
    
    private func appendIfFoodContainsFoodType(foods: [Food]) {
        appendIntoFoodTypeNotContainTodos()
        foods.forEach { food in
            if !foodTypes.contains(food.type) {
                foodTypes.append(food.type)
            }
        }
    }
    
    private func appendIntoFoodTypeNotContainTodos() {
        if !foodTypes.contains("Todos") {
            foodTypes.append("Todos")
        }
    }
    
    private func generateFoodSection(with foods: [Food]) {
        foodTypes.forEach { type in
            let foods = getFoodsByType(foods, type: type)
            let section = FoodSection(title: type, foods: foods)
            
            appendIfNotExistsOtherSectionWithSameTitle(section: section)
        }
        
        foodSections.removeAll(where: { $0.title == "Todos" })
    }
    
    private func appendIfNotExistsOtherSectionWithSameTitle(section: FoodSection) {
        if !foodSections.contains(where: { $0.title == section.title }) {
            foodSections.append(section)
        }
    }
    
    private func getFoodsByType(_ foods: [Food], type: String) -> [Food] {
        foods.filter { $0.type == type }
    }
}

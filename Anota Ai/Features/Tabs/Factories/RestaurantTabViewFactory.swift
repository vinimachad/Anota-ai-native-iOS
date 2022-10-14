//
//  RestaurantTabViewFactory.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 01/10/22.
//

import Foundation
import SwiftUI

struct RestaurantTabViewFactory {
    
    var restaurant: Restaurant
    
    func makeRestaurantDetailsView() -> some View {
        let api = ReviewRoutes()
        let restaurantReviewsUseCase = RestaurantReviewsUseCase(api: api)
        let viewModel = RestaurantDetailViewModel(restaurant: restaurant, restaurantReviewsUseCase: restaurantReviewsUseCase)
        return RestaurantDetailView(viewModel: viewModel)
    }
    
    func makeMenuView() -> some View {
        let api = RestaurantRoutes()
        let getMenuUseCase = GetMenuUseCase(api: api)
        let viewModel = MenuViewModel(getMenuUseCase: getMenuUseCase, restaurant: restaurant)
        return MenuView(viewModel: viewModel)
    }
}

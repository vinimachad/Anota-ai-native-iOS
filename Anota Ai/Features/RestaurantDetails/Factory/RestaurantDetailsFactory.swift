//
//  RestaurantDetailsFactory.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 28/09/22.
//

import SwiftUI

enum RestaurantDetailsFactory {
    
    static func createView(restaurant: Restaurant) -> some View {
        let reviewRoutes = ReviewRoutes()
        let restaurantReviewsUseCase = RestaurantReviewsUseCase(api: reviewRoutes)
        let viewModel = RestaurantDetailViewModel(restaurant: restaurant, restaurantReviewsUseCase: restaurantReviewsUseCase)
        return RestaurantDetailView(viewModel: viewModel)
    }
}

//
//  RestaurantDetailView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 27/09/22.
//

import SwiftUI

struct RestaurantDetailView: View {
    
    // MARK: - Public properties
    
    @StateObject var viewModel: RestaurantDetailViewModel
    
    // MARK: - Body
    
    var body: some View {
        GeometryReader { _ in
            Color.Shapes.shape
                .ignoresSafeArea(.all)
            
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 36) {
                    RestaurantDetailHeaderView(restaurant: viewModel.restaurant)
                    RestaurantDetailsListView(restaurant: viewModel.restaurant)
                    RestaurantReviewsView(restaurant: viewModel.restaurant)
                }
                .padding(.horizontal, 16)
            }
        }
        .onAppear()
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(viewModel: RestaurantDetailViewModel(
            restaurant: Restaurant.sampleData[0],
            restaurantReviewsUseCase: RestaurantReviewsUseCase(api: ReviewRoutes())
            )
        )
    }
}

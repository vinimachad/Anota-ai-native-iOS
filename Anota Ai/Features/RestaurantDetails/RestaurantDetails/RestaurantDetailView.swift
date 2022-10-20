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
    
    init(viewModel: RestaurantDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - Body
    
    var body: some View {
        GeometryReader { _ in
            Color.Shapes.shape
                .ignoresSafeArea(.all)
            
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 36) {
                    RestaurantDetailHeaderView(restaurant: viewModel.restaurant)
                    RestaurantDetailsListView(restaurant: viewModel.restaurant)
                    
                    switch viewModel.reviewsState {
                    case .success(let reviews): RestaurantReviewsView(viewModel: RestaurantReviewsViewModel(reviews: reviews, restaurant: viewModel.restaurant))
                    default: EmptyView()
                    }
                }
                .padding(16)
            }
        }
        .onAppear {
            viewModel.restaurantReviewsRequest()
        }
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

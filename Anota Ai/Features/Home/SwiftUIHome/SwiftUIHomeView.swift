//
//  SwiftUIHomeView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/09/22.
//

import SwiftUI

struct SwiftUIHomeView: View {
    
    @StateObject var viewModel: SwiftUIHomeViewModel
    
    var body: some View {
        GeometryReader { _ in
            Color.Shapes.shape.ignoresSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 32) {
                    RestaurantListView(restaurants: viewModel.restaurants, isVerticalList: false, title: "Famosos por aqui")
                    NearRestaurants(restaurants: viewModel.restaurants)
                    RestaurantKindSlide(kinds: viewModel.restaurantKinds)
                    RestaurantListView(restaurants: viewModel.restaurants, title: "Restaurantes")
                }
            }
            .padding(.horizontal)
                .onAppear(perform: viewModel.callRequests)
        }
    }
}

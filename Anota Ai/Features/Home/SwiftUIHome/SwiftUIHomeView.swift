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
                    RestaurantListView(isVerticalList: false, title: "Famosos por aqui", state: viewModel.bestRatedState)
                    NearRestaurantsView(state: viewModel.nearRestaurantState)
                    RestaurantListView(isVerticalList: true, title: "Restaurantes", state: viewModel.restaurantState)
                }
            }
            .padding(.horizontal)
            .onAppear(perform: viewModel.callRequests)
            .environmentObject(viewModel)
        }
    }
}

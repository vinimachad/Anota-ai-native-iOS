//
//  RestaurantDetailView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 27/09/22.
//

import SwiftUI

struct RestaurantDetailView: View {
    
    // MARK: - Public properties
    
    var restaurant: Restaurant
    
    // MARK: - Body
    
    var body: some View {
        
        GeometryReader { _ in
            Color.Shapes.shape
                .ignoresSafeArea(.all)
            
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 36) {
                    RestaurantDetailHeaderView(restaurant: restaurant)
                    RestaurantDetailsListView(restaurant: restaurant)
                    RestaurantReviewsView(restaurant: restaurant)
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restaurant: Restaurant.sampleData[0])
    }
}

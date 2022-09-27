//
//  NearRestaurants.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 15/09/22.
//

import SwiftUI

struct NearRestaurantsView: View {
    
    var state: RequestState<[Restaurant]>
    @State private var opacity: Double = 0.2
    
    var body: some View {
        switch state {
        case .loading: generateLoadingEffect()
        case .success(let restaurants): listOf(restaurants)
        default: EmptyView()
        }
    }
}

extension NearRestaurantsView {
    
    private func listOf(_ restaurants: [Restaurant]) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Restaurantes proxímos de você")
                .font(.default(type: .bold, ofSize: 16))
                .foregroundColor(.Texts.heading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [GridItem(.flexible())], spacing: 16) {
                    ForEach(restaurants) { restaurant in
                        NearRestaurantCard(restaurant: restaurant)
                    }
                    .frame(width: 150)
                    .background(Color.Shapes.box)
                    .cornerRadius(8)
                    .shadow(color: .Shapes.stroke, radius: 4, x: 4, y: 2)
                }.padding(.vertical, 10)
            }
        }
    }
    
    private func generateLoadingEffect() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            RoundedRectangle(cornerRadius: 4)
                .frame(width: 100, height: 15)
                .foregroundColor(.Shapes.stroke)
            HStack(spacing: 16) {
                ForEach(0..<3) { _ in
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(.Shapes.stroke)
                        .frame(width: 150, height: 180)
                }
            }
        }
//        .shimmerEffect(opacity: opacity)
    }
}

struct NearRestaurants_Previews: PreviewProvider {
    static var previews: some View {
        NearRestaurantsView(state: .success(Restaurant.sampleData))
    }
}

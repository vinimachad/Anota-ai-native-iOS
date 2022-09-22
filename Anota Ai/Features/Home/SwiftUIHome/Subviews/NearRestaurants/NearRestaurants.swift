//
//  NearRestaurants.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 15/09/22.
//

import SwiftUI

struct NearRestaurants: View {
    
    var state: RequestState<[Restaurant]>
    
    var body: some View {
        switch state {
        case .loading: loadingView()
        case .success(let restaurants): listOf(restaurants)
        default: loadingView()
        }
    }
}


extension NearRestaurants {
    
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
}

struct NearRestaurants_Previews: PreviewProvider {
    static var previews: some View {
        NearRestaurants(state: .success(Restaurant.sampleData))
    }
}

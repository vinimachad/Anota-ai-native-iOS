//
//  RestaurantListView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 05/09/22.
//

import SwiftUI

struct RestaurantListView: View {
    
    var restaurants: [Restaurant]
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Restaurantes")
                .font(.default(type: .bold, ofSize: 16))
                .foregroundColor(.Texts.heading)
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(restaurants) { item in
                    CircleRestaurantsView(url: URL(string: item.avatarUrl), name: item.name)
                }
            }
        }
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView(restaurants: [Restaurant(name: "Teste", avatarUrl: "teste", type: "teste", price: 4, id: "asdasf")])
    }
}

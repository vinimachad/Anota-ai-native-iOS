//
//  RestaurantListView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 05/09/22.
//

import SwiftUI

struct RestaurantListView: View {
    
    // MARK: - Properties
    
    var restaurants: [Restaurant]
    var isVerticalList: Bool = true
    var title: String
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.default(type: .bold, ofSize: 16))
                .foregroundColor(.Texts.heading)
            
            if isVerticalList {
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: 16) {
                        generateRestaurantList()
                    }
                }
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: [GridItem(.flexible())], spacing: 16) {
                        generateRestaurantList()
                    }
                }
            }
        }
    }
    
    func generateRestaurantList() -> some View {
        ForEach(restaurants) { item in
            CircleRestaurantsView(url: URL(string: item.avatarUrl), name: item.name)
        }
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView(restaurants: [
            Restaurant(name: "Teste", avatarUrl: "teste", type: "teste", price: 4, id: "asdasf")
        ], title: "Restaurantes")
    }
}

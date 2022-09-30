//
//  RestaurantListView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 05/09/22.
//

import SwiftUI

struct RestaurantListView: View {
    
    // MARK: - Properties
    
    var isVerticalList: Bool = true
    var title: String
    var state: RequestState<[Restaurant]>
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var opacity: Double = 0.4
    
    // MARK: - Body
    
    var body: some View {
        
        switch state {
        case .loading:
            generateRestaurantLoading()
        case .success(let restaurants):
            listOf(restaurants)
        default: EmptyView()
        }
    }
    
    private func generateRestaurantList(_ restaurants: [Restaurant]) -> some View {
        ForEach(restaurants) { item in
            NavigationLink(destination: RestaurantTabView()) {
                CircleRestaurantsView(url: URL(string: item.avatarUrl), name: item.name)
            }
        }
    }
    
    func listOf(_ restaurants: [Restaurant]) -> some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.default(type: .bold, ofSize: 16))
                .foregroundColor(.Texts.heading)
            
            if isVerticalList {
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: 16) {
                        generateRestaurantList(restaurants)
                    }
                }
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: [GridItem(.flexible())], spacing: 16) {
                        generateRestaurantList(restaurants)
                    }
                }
            }
        }
    }
    
    private func generateRestaurantLoading() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            RoundedRectangle(cornerRadius: 4)
                .frame(width: 100, height: 15)
                .foregroundColor(.Shapes.stroke)
            HStack(spacing: 16) {
                ForEach(0..<4) { _ in
                    Circle()
                        .foregroundColor(.Shapes.stroke)
                        .frame(width: 83, height: 83)
                }
            }
        }
        .shimmerEffect(opacity: opacity)
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView(title: "Restaurantes", state: .loading)
    }
}

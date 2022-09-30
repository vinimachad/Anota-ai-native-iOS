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
    
    @StateObject var viewModel: RestaurantListViewModel
    
    // MARK: - Init
    
    init(isVerticalList: Bool, title: String, state: RequestState<[Restaurant]>) {
        self.isVerticalList = isVerticalList
        self.title = title
        self.state = state
        _viewModel = StateObject(wrappedValue: RestaurantListViewModel())
    }
    
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
            RestaurantManager.shared.setSelectedRestaurant(item)
            return NavigationLink(destination: RestaurantTabView()) {
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
                    LazyVGrid(columns: viewModel.columns, spacing: 16) {
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
        .shimmerEffect(opacity: viewModel.opacity)
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView(isVerticalList: true, title: "Restaurantes", state: .success(Restaurant.sampleData))
    }
}

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
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 32) {
                    RestaurantListView(restaurants: viewModel.restaurants)
                    RestaurantKindSlide()
                }
            }
        }.padding(.horizontal)
            .onAppear(perform: viewModel.findRestaurantsRequest)
    }
}

struct SwiftUIHomeView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIHomeView(viewModel: SwiftUIHomeViewModel(findRestaurantsUseCase: FindRestaurantsUseCase(api: RestaurantRoutes())))
    }
}

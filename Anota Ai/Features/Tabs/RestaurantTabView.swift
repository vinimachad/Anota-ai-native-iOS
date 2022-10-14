//
//  RestaurantTabView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 27/09/22.
//

import SwiftUI

struct RestaurantTabView: View {
    
    // MARK: - Public properties
    
    @Environment(\.presentationMode) var presentationMode
    var restaurant: Restaurant
    
    private var factory: RestaurantTabViewFactory
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
        self.factory = RestaurantTabViewFactory(restaurant: restaurant)
    }
    
    // MARK: - Body
    
    var body: some View {
        TabView {
            factory
                .makeRestaurantDetailsView()
                .tabItem({
                    Label("Detalhes", systemImage: "newspaper")
                })
            
            factory
                .makeMenuView()
                .tabItem({
                    Label("Cardápio", systemImage: "menucard")
                })
        }
        .overlay(alignment: .top, content: {
            Color.clear
                .background(.thinMaterial)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 0)
        })
        .navigationBarHidden(false)
        .defaultBackButton(presentationMode: presentationMode)
        .environment(\.colorScheme, .light)
    }
}

struct RestaurantTabView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantTabView(restaurant: Restaurant.sampleData[0])
    }
}

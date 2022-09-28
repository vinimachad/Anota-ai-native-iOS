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
    
    // MARK: - Body
    
    var body: some View {
        TabView {
            RestaurantDetailsFactory
                .createView(restaurant: restaurant)
                .tabItem({
                    Label("Detalhes", systemImage: "newspaper")
                })
            
            MenuView()
                .tabItem({
                    Label("Cardápio", systemImage: "menucard")
                })
        }
        .defaultBackButton(presentationMode: presentationMode)
    }
}

struct RestaurantTabView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantTabView(restaurant: Restaurant.sampleData[0])
    }
}

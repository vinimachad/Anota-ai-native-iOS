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
    
    // MARK: - Body
    
    var body: some View {
        TabView {
            RestaurantDetailsFactory
                .createView()
                .tabItem({
                    Label("Detalhes", systemImage: "newspaper")
                })
            
            MenuFactory
                .createView()
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
        RestaurantTabView()
    }
}

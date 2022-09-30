//
//  MenuFactory.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 30/09/22.
//

import Foundation
import SwiftUI

enum MenuFactory: ViewFactoryProtocol {
    
    static func createView() -> some View {
        let restaurant = RestaurantManager.shared.getSelectedRestaurant()
        let restaurantRoutes = RestaurantRoutes()
        let getMenuUseCase = GetMenuUseCase(api: restaurantRoutes)
        let viewModel = MenuViewModel(getMenuUseCase: getMenuUseCase)
        return MenuView(viewModel: viewModel)
    }
}

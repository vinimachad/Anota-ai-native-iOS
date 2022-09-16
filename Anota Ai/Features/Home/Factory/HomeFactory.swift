//
//  HomeFactory.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 02/09/22.
//

import Foundation
import UIKit
import SwiftUI

enum HomeFactory: ControllerFactoryProtocol {
    
    static func createController() -> UIViewController {
        let api = RestaurantRoutes()
        let restaurantKindsUseCase = RestaurantKindsUseCase(api: api)
        let findRestaurantsUseCase = FindRestaurantsUseCase(api: api)
        let viewModel = SwiftUIHomeViewModel(findRestaurantsUseCase: findRestaurantsUseCase, restaurantKindsUseCase: restaurantKindsUseCase)
        return UIHostingController(rootView: SwiftUIHomeView(viewModel: viewModel))
    }
}

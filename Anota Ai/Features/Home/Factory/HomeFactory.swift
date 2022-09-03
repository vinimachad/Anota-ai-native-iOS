//
//  HomeFactory.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 02/09/22.
//

import Foundation
import UIKit

enum HomeFactory: ControllerFactoryProtocol {
    
    static func createController() -> UIViewController {
        
        let useCase = FindRestaurantsUseCase(api: RestaurantRoutes())
        let viewModel = HomeViewModel(findRestaurantsUseCase: useCase)
        return HomeController(viewModel: viewModel)
    }
}

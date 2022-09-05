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
        
        let useCase = FindRestaurantsUseCase(api: RestaurantRoutes())
        let viewModel = SwiftUIHomeViewModel(findRestaurantsUseCase: useCase)
        return UIHostingController(rootView: SwiftUIHomeView(viewModel: viewModel))
    }
}

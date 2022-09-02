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
        
        let viewModel = HomeViewModel()
        return HomeController(viewModel: viewModel)
    }
}

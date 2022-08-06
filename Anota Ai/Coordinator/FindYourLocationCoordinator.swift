//
//  FindYourLocationCoordinator.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 05/08/22.
//

import UIKit
class FindYourLocationCoordinator: CoordinatorProtocol {
    
    // MARK: - Public properties
    
    var childCoordinator: CoordinatorProtocol?
    
    var containerViewController: UIViewController {
        navigationController
    }
    
    // MARK: - Private properties
    
    private var navigationController = UINavigationController()
    
    // MARK: - Start
    
    func start() -> UIViewController {
        let vc = OnboardingFactory.findYourLocation()
        navigationController.modalPresentationStyle = .pageSheet
        navigationController.setViewControllers([vc], animated: true)
        return navigationController
    }
}

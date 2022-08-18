//
//  OnboardingCoordinator.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/08/22.
//

import Foundation
import UIKit

class OnboardingCoordinator: CoordinatorProtocol {
    
    // MARK: - Public properties
    
    var childCoordinator: CoordinatorProtocol?
    
    var containerViewController: UIViewController {
        navigationController
    }
    
    // MARK: - Private properties
    
    private var navigationController = UINavigationController()
    
    // MARK: - Start
    
    func start() -> UIViewController {
        let vc = OnboardingFactory.onboarding(delegate: self)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.setViewControllers([vc], animated: true)
        return navigationController
    }
}

extension OnboardingCoordinator: OnboardingControllerDelegate {
    
    func pushCreateAccount() {
        navigationController.pushViewController(OnboardingFactory.createAccount(), animated: true)
    }
}

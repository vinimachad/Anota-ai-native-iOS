//
//  OnboardingCoordinator.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/08/22.
//

import Foundation
import UIKit
import CoreLocation

class OnboardingCoordinator: CoordinatorProtocol {
    
    // MARK: - Public properties
    
    var childCoordinator: CoordinatorProtocol?
    
    var containerViewController: UIViewController {
        navigationController
    }
    
    // MARK: - Private properties
    
    private var navigationController = UINavigationController()
    private weak var authDelegate: AuthenticationCoordinatorDelegate?
    
    init(authDelegate: AuthenticationCoordinatorDelegate?) {
        self.authDelegate = authDelegate
    }
    
    // MARK: - Start
    
    func start() -> UIViewController {
        let vc = OnboardingFactory.onboarding(delegate: self)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.setViewControllers([vc], animated: true)
        return navigationController
    }
    
    func returnNavigation() {
        navigationController.dismiss(animated: true)
    }
}

extension OnboardingCoordinator: OnboardingControllerDelegate  {
    
    func pushCreateAccount() {
        navigationController.pushViewController(OnboardingFactory.createAccount(delegate: self), animated: true)
    }
    
    func pushLogin() {
        navigationController.pushViewController(OnboardingFactory.login(delegate: self), animated: true)
    }
}

extension OnboardingCoordinator: CreateAccountControllerDelegate, LoginControllerDelegate {
    
    func presetFindYourLocation() {
        authDelegate?.userWasAuthenticated()
    }
    
    func presentHome() {
        authDelegate?.userWasAuthenticated()
    }
}

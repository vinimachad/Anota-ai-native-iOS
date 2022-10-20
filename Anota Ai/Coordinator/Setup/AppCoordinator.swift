//
//  AppCoordinator.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/08/22.
//

import Foundation
import UIKit

protocol AuthenticationCoordinatorDelegate: AnyObject {
    func userWasAuthenticated()
}

class AppCoordinator {
    
    // MARK: - Private properties
    
    private(set) var window: UIWindow
    private(set) var childCoordinator: CoordinatorProtocol?
    private(set) var session = UserSessionManager.shared
    
    // MARK: - Init
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Start
    
    func start() {
        window.rootViewController = coordinatorBySession()
        window.makeKeyAndVisible()
        window.overrideUserInterfaceStyle = .light
    }
    
    // MARK: - Start methods
    
    private func onboardingCoordinator() -> UIViewController {
        let coordinator = OnboardingCoordinator(authDelegate: self)
        childCoordinator = coordinator
        return coordinator.start()
    }
    
    private func coordinatorBySession() -> UIViewController {
        if session.isLoggedIn() {
            return hasNotAddressValidator()
        }
        
        return onboardingCoordinator()
    }
    
    private func hasNotAddressValidator() -> UIViewController {
        
        if !session.userHasAddress() {
            let coordinator = FindYourLocationCoordinator(delegate: self)
            childCoordinator = coordinator
            return coordinator.start()
        }
        
        let homeCoordinator = HomeCoordinator()
        childCoordinator = homeCoordinator
        return homeCoordinator.start()
    }
    
    private func replaceRootViewController(_ viewController: UIViewController) {
        viewController.modalTransitionStyle = .crossDissolve
        self.window.rootViewController = viewController
    }
}

extension AppCoordinator: AuthenticationCoordinatorDelegate {
    
    func userWasAuthenticated() {
        replaceRootViewController(coordinatorBySession())
    }
}

//
//  AppCoordinator.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/08/22.
//

import Foundation
import UIKit

class AppCoordinator {
    
    // MARK: - Private properties
    
    private var window: UIWindow
    private var childCoordinator: CoordinatorProtocol?
    
    // MARK: - Init
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Start
    
    func start() {
        window.rootViewController = startCoordinator()
        window.makeKeyAndVisible()
    }
    
    // MARK: - Start methods
    
    private func startCoordinator() -> UIViewController {
        let coordinator = OnboardingCoordinator()
        childCoordinator = coordinator
        return coordinator.start()
    }
}

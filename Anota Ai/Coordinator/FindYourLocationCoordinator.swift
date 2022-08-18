//
//  FindYourLocationCoordinator.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 05/08/22.
//

import UIKit
import CoreLocation
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
        let vc = OnboardingFactory.findYourLocation(delegate: self)
        navigationController.setViewControllers([vc], animated: true)
        return navigationController
    }

    func returnNavigation() {
        navigationController.dismiss(animated: true)
    }
}

extension FindYourLocationCoordinator: FindYourLocationControllerDelegate {
    
    func pushConfirmLocalization(_ location: CLLocationCoordinate2D) {
        let vc = OnboardingFactory.confirmLocation(coordinate: location, delegate: self)
        navigationController.pushViewController(vc, animated: true)
    }
}

extension FindYourLocationCoordinator: ConfirmLocationControllerDelegate {
    
}

//
//  OnboardingFactory.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/08/22.
//

import Foundation
import UIKit
import CoreLocation

enum OnboardingFactory {
    
    static func onboarding(delegate: OnboardingControllerDelegate?) -> UIViewController {
        let viewModel = OnboardingViewModel()
        return OnboardingController(viewModel: viewModel, delegate: delegate)
    }
    
    static func findYourLocation(delegate: FindYourLocationControllerDelegate?) -> UIViewController {
        let viewModel = FindYourLocationViewModel()
        return FindYourLocationController(viewModel: viewModel, delegate: delegate)
    }
    
    static func confirmLocation(coordinate: CLLocationCoordinate2D, delegate: ConfirmLocationControllerDelegate?) -> UIViewController {
        let viewModel = ConfirmLocationViewModel(coordinate: coordinate)
        return ConfirmLocationController(viewModel: viewModel, delegate: delegate)
    }
    
    static func createAccount() -> UIViewController {
        let viewModel = CreateAccountViewModel()
        return CreateAccountController(viewModel: viewModel)
    }
}

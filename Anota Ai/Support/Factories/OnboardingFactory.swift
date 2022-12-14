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
        let route = LocationRoutes()
        let findLocalizationUseCase = FindLocalizationUseCase(api: route)
        let createAddressUseCase = CreateAddressUseCase(api: route)
        
        let viewModel = ConfirmLocationViewModel(
            coordinate: coordinate,
            findLocalizationUseCase: findLocalizationUseCase,
            createAddressUseCase: createAddressUseCase
        )
        return ConfirmLocationController(viewModel: viewModel, delegate: delegate)
    }
    
    static func createAccount(delegate: CreateAccountControllerDelegate?) -> UIViewController {
        let createUserAccountUseCase = CreateUserAccountUseCase(api: UserRoutes())
        let viewModel = CreateAccountViewModel(createUserAccountUseCase: createUserAccountUseCase)
        return CreateAccountController(viewModel: viewModel, delegate: delegate)
    }
    
    static func login(delegate: LoginControllerDelegate?) -> UIViewController {
        let userRoutes = UserRoutes()
        let locationRoutes = LocationRoutes()
        
        let authenticateUseCase = AuthenticateUseCase(api: userRoutes)
        let userAddressUseCase = UserAddressesUseCase(api: locationRoutes)
        
        let viewModel = LoginViewModel(authenticateUseCase: authenticateUseCase, userAddressUseCase: userAddressUseCase)
        return LoginController(viewModel: viewModel, delegate: delegate)
    }
}

//
//  OnboardingFactory.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/08/22.
//

import Foundation
import UIKit

enum OnboardingFactory {
    
    static func onboarding(delegate: OnboardingControllerDelegate?) -> UIViewController {
        let viewModel = OnboardingViewModel()
        return OnboardingController(viewModel: viewModel, delegate: delegate)
    }
    
    static func findYourLocation() -> UIViewController {
        let viewModel = FindYourLocationViewModel()
        return FindYourLocationController(viewModel: viewModel)
    }
}

//
//  OnboardingFactory.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/08/22.
//

import Foundation
import UIKit

enum OnboardingFactory {
    
    static func onboarding() -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .orange
        return controller
    }
}

//
//  OnboardingFactory.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 05/08/22.
//

import Foundation
import XCTest
@testable import Anota_Ai

class OnboardingFactoryTests: XCTestCase {
    
    func test_onboarding_whenOnboardingIsCalled_expectedReturnsOnboardingController() {
        XCTAssertTrue(OnboardingFactory.onboarding(delegate: nil) is OnboardingController<OnboardingViewModel>)
    }
}

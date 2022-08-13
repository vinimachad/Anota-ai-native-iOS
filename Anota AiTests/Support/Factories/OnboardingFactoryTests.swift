//
//  OnboardingFactory.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 05/08/22.
//

import Foundation
import XCTest
@testable import Anota_Ai
import CoreLocation

class OnboardingFactoryTests: XCTestCase {
    
    func test_onboarding_whenOnboardingIsCalled_expectedReturnsOnboardingController() {
        XCTAssertTrue(OnboardingFactory.onboarding(delegate: nil) is OnboardingController<OnboardingViewModel>)
    }
    
    func test_findYourLocation_expectedReturnFindYourLocationController() {
        XCTAssertTrue(OnboardingFactory.findYourLocation(delegate: nil) is FindYourLocationController<FindYourLocationViewModel>)
    }
    
    func test_confirmLocation_expectedReturnConfirmLocationController() {
        XCTAssertTrue(OnboardingFactory.confirmLocation(coordinate: CLLocationCoordinate2D()) is ConfirmLocationController<ConfirmLocationViewModel>)
    }
}

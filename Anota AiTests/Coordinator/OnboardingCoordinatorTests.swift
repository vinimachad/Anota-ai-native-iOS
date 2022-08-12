//
//  OnboardingCoordinatorTests.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 04/08/22.
//

import Foundation
import XCTest
@testable import Anota_Ai

class OnboardingCoordinatorTests: XCTestCase {
    
    var sut: OnboardingCoordinator!
    
    override func setUp() {
        self.sut = OnboardingCoordinator()
    }
    
    func test_start_whenStartIsCalled_expectedNavigationControllerIsEqualToOnboardingController() {
        _ = sut.start()
        let result = sut.containerViewController as! UINavigationController
        XCTAssertTrue(result.topViewController is OnboardingController<OnboardingViewModel>)
    }
    
    func test_presentFindYourLocation_whenIsCalled_expectedChildCoordinatorIsEqualToFindYourLocationCoordinator() {
        sut.presentFindYourLocation()
        XCTAssertTrue(sut.childCoordinator is FindYourLocationCoordinator)
    }
}

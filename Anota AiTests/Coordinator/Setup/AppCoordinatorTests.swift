//
//  AppCoordinatorTests.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 04/08/22.
//

import Foundation
import XCTest
@testable import Anota_Ai

class AppCoordinatorTests: XCTestCase {
    
    var sut: AppCoordinator!
    var window: UIWindow!
    
    override func setUp() {
        self.window = UIWindow()
        self.sut = AppCoordinator(window: window)
    }
    
    func test_start_whenStartIsCalled_expectedChildCoordinatorIsOnboardinCoordinator() {
        sut.start()
        XCTAssertTrue(sut.childCoordinator is OnboardingCoordinator)
    }
}

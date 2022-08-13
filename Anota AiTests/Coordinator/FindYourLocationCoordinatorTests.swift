//
//  FindYourLocationCoordinatorTests.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 11/08/22.
//

import Foundation
@testable import Anota_Ai
import XCTest
import CoreLocation

class FindYourLocationCoordinatorTests: XCTestCase {
    
    var sut: FindYourLocationCoordinator!
    
    override func setUp() {
        sut = FindYourLocationCoordinator()
    }
    
    func test_start_expectedNavigationControllerIsEqualToFindYourLocationController() {
        _ = sut.start()
        let result = sut.containerViewController as! UINavigationController
        XCTAssertTrue(result.topViewController is FindYourLocationController<FindYourLocationViewModel>)
    }
    
    func test_pushConfirmLocalization_expectedNavigationControllerIsEqualToConfirmLocationController() {
        sut.pushConfirmLocalization(CLLocationCoordinate2D(latitude: 0, longitude: 0))
        let result = sut.containerViewController as! UINavigationController
        XCTAssertTrue(result.topViewController is ConfirmLocationController<ConfirmLocationViewModel>)
    }
}

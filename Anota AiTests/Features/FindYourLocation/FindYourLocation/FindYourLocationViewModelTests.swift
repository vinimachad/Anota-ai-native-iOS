//
//  FindYourLocationViewModelTests.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 06/08/22.
//

import Foundation
import XCTest
@testable import Anota_Ai
import CoreLocation

class FindYourLocationViewModelTests: XCTestCase {
    
    var sut: FindYourLocationViewModel!
    var localizationMock: LocalizationMock!
    
    override func setUp() {
        sut = FindYourLocationViewModel()
        self.localizationMock = LocalizationMock()
        sut.location = localizationMock
    }
    
    func test_requestLocationAuthorization_whenWeHaveAuthorizedWhenInUseAndLocationServicesIsEnabled_expectedInvokeOnSuccessGetAuthorization() {
        
        var invokedOnSuccessGetAuthorizationCount = 0
        
        sut.onSuccessGetAuthorization = {
            invokedOnSuccessGetAuthorizationCount += 1
        }
        
        localizationMock.locationServiceIsEnabled = true
        localizationMock.authorizationStatus = .authorizedWhenInUse
        
        sut.requestLocationAuthorization()
        
        XCTAssertEqual(sut.location.locationServicesEnabled(), true)
        XCTAssertEqual(sut.location.getAuthorizationStatus(), CLAuthorizationStatus.authorizedWhenInUse)
        XCTAssertEqual(invokedOnSuccessGetAuthorizationCount, 1)
    }
    
    func test_requestLocationAuthorization_whenWeHaveAuthorizationDenied_expectedInvokeOnFailureGetAuthorization() {
        var invokedOnFailureGetAuthorizationCount = 0
        
        sut.onFailureGetAuthorization = {
            invokedOnFailureGetAuthorizationCount += 1
        }
        
        localizationMock.locationServiceIsEnabled = true
        localizationMock.authorizationStatus = .denied
        
        sut.requestLocationAuthorization()
        
        XCTAssertEqual(sut.location.locationServicesEnabled(), true)
        XCTAssertEqual(sut.location.getAuthorizationStatus(), CLAuthorizationStatus.denied)
        XCTAssertEqual(invokedOnFailureGetAuthorizationCount, 1)
    }
}

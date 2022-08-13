//
//  ConfirmLocationViewModelTests.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 13/08/22.
//

import Foundation
@testable import Anota_Ai
import XCTest
import CoreLocation

class ConfirmLocationViewModelTests: XCTestCase {
    
    var sut: ConfirmLocationViewModel!
    
    override func setUp() {
        sut = ConfirmLocationViewModel(coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0))
    }
    
    func test_didChangeNumber_whenReceiveValue_expectedInvokedOnButtonStateIsEnableAsTrue() {
        var invokedOnButtonStateIsEnable = (count: 0, value: false)
        
        sut.onButtonStateIsEnable = { isEnable in
            invokedOnButtonStateIsEnable.count += 1
            invokedOnButtonStateIsEnable.value = isEnable
        }
        
        sut.didChangeNumber(text: "Text")
        XCTAssertEqual(invokedOnButtonStateIsEnable.count, 1)
        XCTAssertEqual(invokedOnButtonStateIsEnable.value, true)
    }
    
    func test_didChangeNumber_whenNotReceiveValue_expectedInvokedOnButtonStateIsEnableAsFalse() {
        var invokedOnButtonStateIsEnable = (count: 0, value: true)
        
        sut.onButtonStateIsEnable = { isEnable in
            invokedOnButtonStateIsEnable.count += 1
            invokedOnButtonStateIsEnable.value = isEnable
        }
        
        sut.didChangeNumber(text: "")
        XCTAssertEqual(invokedOnButtonStateIsEnable.count, 1)
        XCTAssertEqual(invokedOnButtonStateIsEnable.value, false)
    }
    
    func test_didSaveAddress_expectedInvoke() {
        
    }
}

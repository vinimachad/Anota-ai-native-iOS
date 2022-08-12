//
//  FindYourLocationControllerDelegateMock.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 06/08/22.
//

import Foundation
@testable import Anota_Ai
import CoreLocation

class FindYourLocationControllerDelegateMock: FindYourLocationControllerDelegate {
   
    var invokedPushConfirmLocalizationCount = 0
    var invokedReturnNavigationCount = 0
    
    func returnNavigation() {
        invokedReturnNavigationCount += 1
    }
    
    func pushConfirmLocalization(_ location: CLLocationCoordinate2D) {
        invokedPushConfirmLocalizationCount += 1
    }
}

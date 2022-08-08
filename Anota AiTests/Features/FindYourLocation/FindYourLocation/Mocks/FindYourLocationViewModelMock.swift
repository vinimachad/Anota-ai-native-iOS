//
//  FindYourLocationViewModelMock.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 06/08/22.
//

import Foundation
@testable import Anota_Ai
import CoreLocation

class FindYourLocationViewModelMock: FindYourLocationProtocol {
    
    var invokedRequestLocationAuthorizationCount = 0
    
    var location: LocalizationProtocol = Localization()
    var onUpdateUserCurrentLocation: ((CLLocationCoordinate2D) -> Void)?
    var onSuccessGetAuthorization: (() -> Void)?
    var onFailureGetAuthorization: (() -> Void)?
    
    func requestLocationAuthorization() {
        invokedRequestLocationAuthorizationCount += 1
    }
}

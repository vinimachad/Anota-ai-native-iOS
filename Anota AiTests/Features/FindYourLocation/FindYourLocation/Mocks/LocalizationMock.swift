//
//  LocalizationMock.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 08/08/22.
//

import Foundation
@testable import Anota_Ai
import CoreLocation

class LocalizationMock: LocalizationProtocol {
    
    var invokedRequestLocationAuthorizationCount = 0
    var invokedGetAuthorizationStatusCount = 0
    var invokedLocationServicesEnabledCount = 0
    
    var authorizationStatus: CLAuthorizationStatus = .denied
    var locationServiceIsEnabled: Bool = false
    
    var locationManager: CLLocationManager = CLLocationManager()
    var delegate: LocalizationDelegate?
    
    var onAuthorizedLocalization: (() -> Void)?
    var onNotAuthorizedLocalization: (() -> Void)?
    
    func requestLocationAuthorization() {
        invokedRequestLocationAuthorizationCount += 1
    }
    
    func getAuthorizationStatus() -> CLAuthorizationStatus {
        invokedGetAuthorizationStatusCount += 1
        
        switch authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse: onAuthorizedLocalization?()
        case .denied, .notDetermined, .restricted: onNotAuthorizedLocalization?()
        @unknown default: break;
        }
        
        return authorizationStatus
    }
    
    func locationServicesEnabled() -> Bool {
        invokedLocationServicesEnabledCount += 1
        return locationServiceIsEnabled
    }
}

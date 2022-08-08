//
//  LocalizationDelegateMock.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 08/08/22.
//

import Foundation
@testable import Anota_Ai
import CoreLocation
import XCTest

class LocalizationDelegateMock: LocalizationDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

    }
}

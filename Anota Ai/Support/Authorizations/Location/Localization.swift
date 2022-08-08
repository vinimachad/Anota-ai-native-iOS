//
//  Location.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 06/08/22.
//

import Foundation
import CoreLocation

protocol LocalizationProtocol {
    var locationManager: CLLocationManager { get }
    
    var onAuthorizedLocalization: (() -> Void)? { get set }
    var onNotAuthorizedLocalization: (() -> Void)? { get set }
    
    func requestLocationAuthorization(delegate: CLLocationManagerDelegate?)
    func getAuthorizationStatus() -> CLAuthorizationStatus
    func locationServicesEnabled() -> Bool
}

class Localization {
    
    // MARK: - Public properties
    
    let locationManager = CLLocationManager()
    var onAuthorizedLocalization: (() -> Void)?
    var onNotAuthorizedLocalization: (() -> Void)?
    
    // MARK: - Init
    
    init(onAuthorizedLocalization: (() -> Void)? = nil, onNotAuthorizedLocalization: (() -> Void)? = nil) {
        self.onAuthorizedLocalization = onAuthorizedLocalization
        self.onNotAuthorizedLocalization = onNotAuthorizedLocalization
    }
    
    // MARK: - Request authorization
    
    private func requestAlwaysAuthorization() {
        locationManager.requestAlwaysAuthorization()
    }
    
    private func requestWhenInUseAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    private func startUpdatingLocation(delegate: CLLocationManagerDelegate?) {
        if locationServicesEnabled() {
            checkStatus(delegate: delegate)
        }
    }
    
    // MARK: - Status
    
    private func checkStatus(delegate: CLLocationManagerDelegate?) {
        switch getAuthorizationStatus() {
        case .notDetermined, .denied, .restricted: notAuthorizedLocalization()
        case .authorizedAlways, .authorizedWhenInUse: authorizedLocalization(delegate: delegate)
        @unknown default: break
        }
    }
    
    private func notAuthorizedLocalization() {
        onNotAuthorizedLocalization?()
    }
    
    private func authorizedLocalization(delegate: CLLocationManagerDelegate?) {
        onAuthorizedLocalization?()
        locationManager.delegate = delegate
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }
}

// MARK: - LocationProtocol

extension Localization: LocalizationProtocol {
    
    func requestLocationAuthorization(delegate: CLLocationManagerDelegate?) {
        requestAlwaysAuthorization()
        requestWhenInUseAuthorization()
        startUpdatingLocation(delegate: delegate)
    }
    
    func getAuthorizationStatus() -> CLAuthorizationStatus {
        locationManager.authorizationStatus
    }
    
    func locationServicesEnabled() -> Bool {
        CLLocationManager.locationServicesEnabled()
    }
}

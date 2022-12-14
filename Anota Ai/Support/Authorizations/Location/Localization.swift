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
    var delegate: LocalizationDelegate? { get set }
    
    var onAuthorizedLocalization: (() -> Void)? { get set }
    var onNotAuthorizedLocalization: (() -> Void)? { get set }
    
    func requestLocationAuthorization()
    func getAuthorizationStatus() -> CLAuthorizationStatus
    func locationServicesEnabled() -> Bool
    func startUpdatingLocation()
}

protocol LocalizationDelegate: AnyObject {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager)
}

class Localization: NSObject {
    
    // MARK: - Public properties
    
    weak var delegate: LocalizationDelegate?
    let locationManager = CLLocationManager()
    var onAuthorizedLocalization: (() -> Void)?
    var onNotAuthorizedLocalization: (() -> Void)?
    
    // MARK: - Request authorization
    
    private func requestAlwaysAuthorization() {
        locationManager.requestAlwaysAuthorization()
    }
    
    private func requestWhenInUseAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func startUpdatingLocation() {
        if locationServicesEnabled() {
            checkStatus()
        }
    }
    
    // MARK: - Status
    
    private func checkStatus() {
        switch getAuthorizationStatus() {
        case .denied, .restricted: notAuthorizedLocalization()
        case .authorizedAlways, .authorizedWhenInUse: authorizedLocalization()
        default: break
        }
    }
    
    private func notAuthorizedLocalization() {
        onNotAuthorizedLocalization?()
    }
    
    private func authorizedLocalization() {
        onAuthorizedLocalization?()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }
}

// MARK: - LocationProtocol

extension Localization: LocalizationProtocol {
    
    func requestLocationAuthorization() {
        requestAlwaysAuthorization()
        requestWhenInUseAuthorization()
        locationManager.delegate = self
        startUpdatingLocation()
    }
    
    func getAuthorizationStatus() -> CLAuthorizationStatus {
        locationManager.authorizationStatus
    }
    
    func locationServicesEnabled() -> Bool {
        CLLocationManager.locationServicesEnabled()
    }
}


// MARK: - CLLocationManagerDelegate

extension Localization: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        delegate?.locationManager(manager, didUpdateLocations: locations)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        delegate?.locationManagerDidChangeAuthorization(manager)
    }
}

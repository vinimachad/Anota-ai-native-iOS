//
//  Location.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 06/08/22.
//

import Foundation
import CoreLocation

protocol LocationProtocol {
    func requestLocationAuthorization(delegate: CLLocationManagerDelegate?)
}

class Location {
    
    private let locationManager = CLLocationManager()
    
    // MARK: - Request authorization
    
    private func requestAlwaysAuthorization() {
        locationManager.requestAlwaysAuthorization()
    }
    
    private func requestWhenInUseAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    private func startUpdatingLocation(delegate: CLLocationManagerDelegate?) {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = delegate
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
}

// MARK: - LocationProtocol

extension Location: LocationProtocol {
    
    func requestLocationAuthorization(delegate: CLLocationManagerDelegate?) {
        requestAlwaysAuthorization()
        requestWhenInUseAuthorization()
        startUpdatingLocation(delegate: delegate)
    }
}

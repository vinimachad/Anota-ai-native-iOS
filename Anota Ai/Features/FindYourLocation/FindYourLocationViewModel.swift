//
//  FindYourLocationViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 05/08/22.
//

import Foundation
import CoreLocation

protocol FindYourLocationProtocol: FindYourLocationViewModelProtocol {
    
}

class FindYourLocationViewModel {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private let locationManager = CLLocationManager()
    
    // MARK: - Init
}

// MARK: - FindYourLocationProtocol

extension FindYourLocationViewModel: FindYourLocationProtocol {
    
    func requestLocationAuthorization(delegate: CLLocationManagerDelegate?) {
        requestAlwaysAuthorization()
        requestWhenInUseAuthorization()
        startUpdatingLocation(delegate: delegate)
    }
    
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

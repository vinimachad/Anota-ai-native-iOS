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

class FindYourLocationViewModel: NSObject {
    
    // MARK: - Public properties
    
    var onUpdateUserCurrentLocation: ((CLLocationCoordinate2D) -> Void)?
    
    // MARK: - Private properties
    
    private var location: LocationProtocol = Location()
    
    // MARK: - Methods
    
    private func updateCoordinate(_ coordinate: CLLocationCoordinate2D) {
        onUpdateUserCurrentLocation?(coordinate)
    }
}

// MARK: - FindYourLocationProtocol

extension FindYourLocationViewModel: FindYourLocationProtocol {
    
    func requestLocationAuthorization() {
        location.requestLocationAuthorization(delegate: self)
    }
}

extension FindYourLocationViewModel: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        updateCoordinate(coordinate)
    }
}

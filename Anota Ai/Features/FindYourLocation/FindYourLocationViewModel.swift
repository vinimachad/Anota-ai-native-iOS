//
//  FindYourLocationViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 05/08/22.
//

import Foundation
import CoreLocation

protocol FindYourLocationProtocol: FindYourLocationViewModelProtocol {
    var location: LocalizationProtocol { get set }
    var onSuccessGetAuthorization: (() -> Void)? { get set }
    var onFailureGetAuthorization: (() -> Void)? { get set }
}

class FindYourLocationViewModel: NSObject {
    
    // MARK: - Public properties
    
    var onUpdateUserCurrentLocation: ((CLLocationCoordinate2D) -> Void)?
    var onSuccessGetAuthorization: (() -> Void)?
    var onFailureGetAuthorization: (() -> Void)?
    
    // MARK: - Private properties
    
    lazy var location: LocalizationProtocol = Localization(
        onAuthorizedLocalization: self.didAuthorizedLocalization,
        onNotAuthorizedLocalization: self.didNotAuthorizedLocalization
    )
    
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
    
    private func didAuthorizedLocalization() {
        onSuccessGetAuthorization?()
    }
    
    private func didNotAuthorizedLocalization() {
        onFailureGetAuthorization?()
    }
}

extension FindYourLocationViewModel: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        updateCoordinate(coordinate)
    }
}

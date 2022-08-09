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
    func requestLocationAuthorization()
}

class FindYourLocationViewModel {
    
    // MARK: - Public properties
    
    var onUpdateUserCurrentLocation: ((CLLocationCoordinate2D) -> Void)?
    var onSuccessGetAuthorization: (() -> Void)?
    var onFailureGetAuthorization: (() -> Void)?
    
    // MARK: - Private properties
    
    lazy var location: LocalizationProtocol = Localization()
    
    // MARK: - Init
    
    init() {
        location.delegate = self
    }
    
    // MARK: - Methods
    
    private func updateCoordinate(_ coordinate: CLLocationCoordinate2D) {
        onUpdateUserCurrentLocation?(coordinate)
    }
}

// MARK: - FindYourLocationProtocol

extension FindYourLocationViewModel: FindYourLocationProtocol {
    
    func requestLocationAuthorization() {
        didAuthorizedLocalization()
        didNotAuthorizedLocalization()
        location.requestLocationAuthorization()
    }
    
    private func didAuthorizedLocalization() {
        location.onAuthorizedLocalization = { [weak self] in
            self?.suas()
        }
    }
    
    func suas() {
        self.onSuccessGetAuthorization?()
    }
    
    private func didNotAuthorizedLocalization() {
        location.onNotAuthorizedLocalization = { [weak self] in
            self?.onFailureGetAuthorization?()
        }
    }
}

extension FindYourLocationViewModel: LocalizationDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        updateCoordinate(coordinate)
    }
}
                                                                        

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
    var onSuccessGetLocalization: ((CLLocationCoordinate2D) -> Void)? { get set }
    func requestLocationAuthorization()
}

class FindYourLocationViewModel {
    
    // MARK: - Public properties
    
    var onUpdateUserCurrentLocation: ((CLLocationCoordinate2D) -> Void)?
    var onSuccessGetAuthorization: (() -> Void)?
    var onFailureGetAuthorization: (() -> Void)?
    var onSuccessGetLocalization: ((CLLocationCoordinate2D) -> Void)?
    
    // MARK: - Private properties
    
    lazy var location: LocalizationProtocol = Localization()
    private var currentLocation: CLLocationCoordinate2D?
    
    // MARK: - Init
    
    init() {
        location.delegate = self
    }
    
    // MARK: - Methods
    
    private func updateCoordinate(_ coordinate: CLLocationCoordinate2D) {
        updateCurrentLocation(coordinate)
        onUpdateUserCurrentLocation?(coordinate)
    }
    
    private func updateCurrentLocation(_ coordinate: CLLocationCoordinate2D) {
        currentLocation = coordinate
    }
}

// MARK: - FindYourLocationProtocol

extension FindYourLocationViewModel: FindYourLocationProtocol {
    
    var mapViewModel: MapViewModelProtocol {
        MapViewModel(onUpdateCoordinate: updateCurrentLocation(_:))
    }
    
    func requestLocationAuthorization() {
        didAuthorizedLocalization()
        didNotAuthorizedLocalization()
        location.requestLocationAuthorization()
    }
    
    func didConfirmLocation() {
        guard let currentLocation = currentLocation else { return }
        onSuccessGetLocalization?(currentLocation)
    }
    
    private func didAuthorizedLocalization() {
        location.onAuthorizedLocalization = { [weak self] in
            self?.onSuccessGetAuthorization?()
        }
    }
    
    private func didNotAuthorizedLocalization() {
        location.onNotAuthorizedLocalization = { [weak self] in
            self?.onFailureGetAuthorization?()
        }
    }
}

extension FindYourLocationViewModel: LocalizationDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
        guard let coordinate: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        updateCoordinate(coordinate)
    }
}
                                                                        

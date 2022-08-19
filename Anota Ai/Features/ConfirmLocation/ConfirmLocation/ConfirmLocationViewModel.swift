//
//  ConfirmLocationViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 12/08/22.
//

import Foundation
import MapKit

protocol ConfirmLocationProtocol: ConfirmLocationViewModelProtocol {
    var onSaveAddress: (() -> Void)? { get set }
    
    var onStartFindLocation: (() -> Void)? { get set }
    var onSuccessFindLocation: (() -> Void)? { get set }
    var onFailureFindLocation: ((String) -> Void)? { get set }
    
    func validateFields()
    func findLocateRequest()
}

class ConfirmLocationViewModel {
    
    // MARK: - Public properties
    
    var onStartFindLocation: (() -> Void)?
    var onSuccessFindLocation: (() -> Void)?
    var onFailureFindLocation: ((String) -> Void)?
    
    var onUpdateNumber: ((String) -> Void)?
    var onChangeLocationDetails: (() -> Void)?
    
    var onButtonStateIsEnable: ((Bool) -> Void)?
    var onSaveAddress: (() -> Void)?
    
    // MARK: - Private properties
    
    private var coordinate: CLLocationCoordinate2D
    private var address = Address()
    private var findLocalizationUseCase: FindLocalizationUseCaseProtocol
    
    // MARK: - Init
    
    init(coordinate: CLLocationCoordinate2D, findLocalizationUseCase: FindLocalizationUseCaseProtocol) {
        self.coordinate = coordinate
        self.findLocalizationUseCase = findLocalizationUseCase
        validateFields()
    }
    
    // MARK: - Validation
    
    func validateFields() {
        if !address.streetNumber.isEmpty {
            onButtonStateIsEnable?(true)
            return
        }
        onButtonStateIsEnable?(false)
    }
}

// MARK: - ConfirmLocationProtocol

extension ConfirmLocationViewModel: ConfirmLocationProtocol {
    
    var region: MKCoordinateRegion {
        MKCoordinateRegion(center: coordinate, latitudinalMeters: 100, longitudinalMeters: 100)
    }
    
    var streetDetails: String {
        "\(address.street), \(address.streetNumber) - \(address.district)"
    }
    
    var city: String {
        "\(address.city) - \(address.state), \(address.postalCode)"
    }
    
    var streetNumber: String {
        address.streetNumber
    }
    
    // MARK: - Methods
    
    func didChangeNumber(text: String?) {
        address.streetNumber = text ?? ""
        onUpdateNumber?(streetDetails)
        validateFields()
    }
    
    func didChangeComplement(text: String?) {
        address.complement = text ?? ""
    }
    
    func didSaveAddress() {
        onSaveAddress?()
    }
}

extension ConfirmLocationViewModel {
    
    func findLocateRequest() {
        let coordinate = Coordinate(lat: String(coordinate.latitude), long: String(coordinate.longitude))
        
        DispatchQueue.global().async { [weak self] in
            self?.onStartFindLocation?()
            
            self?.findLocalizationUseCase.execute(
                req: coordinate,
                success: { [weak self] address in
                    self?.address = address
                    self?.onSuccessFindLocation?()
                    self?.onChangeLocationDetails?()
                },
                failure: { [weak self] message in
                    self?.onFailureFindLocation?(message)
                }
            )
        }
    }
}

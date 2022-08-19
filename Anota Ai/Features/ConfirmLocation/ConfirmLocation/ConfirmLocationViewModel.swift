//
//  ConfirmLocationViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 12/08/22.
//

import Foundation
import MapKit

protocol ConfirmLocationProtocol: ConfirmLocationViewModelProtocol {
    var onStartLoading: (() -> Void)? { get set }
    var onSuccessFindLocation: (() -> Void)? { get set }
    var onFailureFindLocation: ((String) -> Void)? { get set }
    
    var onSuccessCreateAddress: (() -> Void)? { get set }
    var onFailureCreateAddress: ((String) -> Void)? { get set }
    
    func validateFields()
    func findLocateRequest()
}

class ConfirmLocationViewModel {
    
    // MARK: - Public properties
    
    var onStartLoading: (() -> Void)?
    var onSuccessFindLocation: (() -> Void)?
    var onFailureFindLocation: ((String) -> Void)?
    
    var onUpdateNumber: ((String) -> Void)?
    var onChangeLocationDetails: (() -> Void)?
    
    var onButtonStateIsEnable: ((Bool) -> Void)?
    var onSuccessCreateAddress: (() -> Void)?
    var onFailureCreateAddress: ((String) -> Void)?
    
    // MARK: - Private properties
    
    private var coordinate: Coordinate
    private var address = Address()
    private var findLocalizationUseCase: FindLocalizationUseCaseProtocol
    private var createAddressUseCase: CreateAddressUseCaseProtocol
    
    // MARK: - Init
    
    init(coordinate: CLLocationCoordinate2D, findLocalizationUseCase: FindLocalizationUseCaseProtocol, createAddressUseCase: CreateAddressUseCaseProtocol) {
        self.coordinate = Coordinate(lat: String(coordinate.latitude), long: String(coordinate.longitude))
        self.findLocalizationUseCase = findLocalizationUseCase
        self.createAddressUseCase = createAddressUseCase
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
        MKCoordinateRegion(center: coordinate.convertToLocation(), latitudinalMeters: 100, longitudinalMeters: 100)
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
        saveAddressRequest()
    }
}

extension ConfirmLocationViewModel {
    
    func findLocateRequest() {
        onStartLoading?()
        
        self.findLocalizationUseCase.execute(
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
    
    func saveAddressRequest() {
        
        onStartLoading?()
        
        self.createAddressUseCase.execute(
            req: address,
            success: { [weak self] in
                UserSessionManager.shared.setUserHasAddress(true)
                self?.onSuccessCreateAddress?()
            },
            failure: { [weak self] error in
                self?.onFailureCreateAddress?(error)
            }
        )
    }
}

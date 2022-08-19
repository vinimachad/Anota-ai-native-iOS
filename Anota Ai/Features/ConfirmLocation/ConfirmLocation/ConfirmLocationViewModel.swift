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
    func validateFields()
}

class ConfirmLocationViewModel {
    
    // MARK: - Public properties
    
    var onButtonStateIsEnable: ((Bool) -> Void)?
    var onSaveAddress: (() -> Void)?
    
    // MARK: - Private properties
    
    private var coordinate: CLLocationCoordinate2D
    private var numberField: String?
    private var complementField: String?
    
    // MARK: - Init
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        validateFields()
    }
    
    // MARK: - Validation
    
    func validateFields() {
        if let numberField = numberField, !numberField.isEmpty {
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
    
    var street: String {
        "R. Araras, 187, São Francisco"
    }
    
    var city: String {
        "Campo Grande - MS, 79118-040"
    }
    
    // MARK: - Methods
    
    func didChangeNumber(text: String?) {
        numberField = text
        validateFields()
    }
    
    func didChangeComplement(text: String?) {
        complementField = text
    }
    
    func didSaveAddress() {
        onSaveAddress?()
    }
}

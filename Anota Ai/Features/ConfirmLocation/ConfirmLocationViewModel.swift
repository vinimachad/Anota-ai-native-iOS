//
//  ConfirmLocationViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 12/08/22.
//

import Foundation
import MapKit

protocol ConfirmLocationProtocol: ConfirmLocationViewModelProtocol {
    
}

class ConfirmLocationViewModel {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private var coordinate: CLLocationCoordinate2D
    
    // MARK: - Init
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
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
}

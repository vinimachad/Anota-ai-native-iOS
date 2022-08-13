//
//  MapViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 13/08/22.
//

import Foundation
import CoreLocation

struct MapViewModel: MapViewModelProtocol {
    
    var onUpdateCoordinate: ((CLLocationCoordinate2D) -> Void)?
    
    func didUpdateCoordinate(coordinate: CLLocationCoordinate2D) {
        onUpdateCoordinate?(coordinate)
    }
}

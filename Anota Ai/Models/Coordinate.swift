//
//  Coordinate.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 18/08/22.
//

import Foundation
import CoreLocation

struct Coordinate: Encodable {
    var lat: String
    var long: String
    
    func convertToLocation() -> CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: Double(lat) ?? 0, longitude: Double(long) ?? 0)
    }
}

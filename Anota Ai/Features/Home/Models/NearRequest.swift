//
//  NearRequest.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 23/09/22.
//

import Foundation

struct NearRequest: Encodable {
    var lat: String
    var long: String
    var maxDistance: Int
    
    func toJson() -> [String: String] {
        [
            "lat": lat,
            "long": long,
            "max_distance": String(maxDistance)
        ]
    }
}

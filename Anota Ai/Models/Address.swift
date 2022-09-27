//
//  Address.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 18/08/22.
//

import Foundation
import CoreLocation

struct Address: Decodable {
    var streetNumber: String = ""
    var street: String = ""
    var district: String = ""
    var city: String = ""
    var state: String = ""
    var country: String = ""
    var postalCode: String = ""
    var formattedAddress: String = ""
    var complement: String?
    var lat: String? = ""
    var long: String? = ""
    
    func toAddressRequest() -> AddressRequest {
        AddressRequest(
            streetNumber: streetNumber,
            street: street,
            district: district,
            city: city,
            state: state,
            country: country,
            postalCode: postalCode,
            formattedAddress: formattedAddress,
            complement: complement,
            coordinate: AddressRequest.Location(lat: lat ?? "", long: long ?? "")
        )
    }
}

struct AddressRequest: Encodable {
    var streetNumber: String = ""
    var street: String = ""
    var district: String = ""
    var city: String = ""
    var state: String = ""
    var country: String = ""
    var postalCode: String = ""
    var formattedAddress: String = ""
    var complement: String?
    var coordinate: Location = Location()
    
    struct Location: Codable {
        var lat: String = ""
        var long: String = ""
    }
}

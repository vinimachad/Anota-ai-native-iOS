//
//  Address.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 18/08/22.
//

import Foundation

struct Address: Codable {
    var streetNumber: String
    var street: String
    var district: String
    var city: String
    var state: String
    var country: String
    var postalCode: String
    var formattedAddress: String
    var complement: String?
}

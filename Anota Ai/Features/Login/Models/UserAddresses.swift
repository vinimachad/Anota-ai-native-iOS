//
//  UserAddresses.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 25/09/22.
//

import Foundation

struct UserAddress: Decodable {
    var isEmpty: Bool
    var addresses: [Address]?
}

struct UserAddressRequest: Encodable {
    var userId: String
    
    func toJson() -> [String: String] {
        ["user_id": userId]
    }
}

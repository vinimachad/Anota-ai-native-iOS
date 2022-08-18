//
//  User.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 17/08/22.
//

import Foundation

struct User: Decodable {
    var email: String
    var name: String
    var lastName: String
    var password: String
    var coordinate: Coordinate
}

struct UserRequest: Encodable {
    var email: String
    var name: String
    var lastName: String
    var password: String
    var coordinate: Coordinate
}

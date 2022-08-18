//
//  UserSession.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 17/08/22.
//

import Foundation

struct UserSession: Codable {
    var id: String = ""
    var email: String = ""
    var name: String = ""
    var refreshToken: String = ""
}

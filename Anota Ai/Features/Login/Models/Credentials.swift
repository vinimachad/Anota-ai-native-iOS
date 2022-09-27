//
//  Credentials.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 19/08/22.
//

import Foundation

struct Credentials: Encodable {
    var email: String = ""
    var password: String = ""
    
    func isFilled() -> Bool {
        if email.isEmpty && password.isEmpty {
            return false
        }
        return true
    }
}

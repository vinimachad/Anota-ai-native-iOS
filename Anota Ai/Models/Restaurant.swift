//
//  Restaurant.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 02/09/22.
//

import Foundation

struct Restaurant: Codable, Identifiable {
    var name: String
    var avatarUrl: String
    var type: String
    var price: Int
    var id: String
}

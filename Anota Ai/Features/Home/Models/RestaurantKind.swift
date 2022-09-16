//
//  RestaurantKind.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 16/09/22.
//

import Foundation

struct RestaurantKind: Decodable, Identifiable {
    var id: String
    var type: String
}

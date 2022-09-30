//
//  Menu.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 30/09/22.
//

import Foundation

struct Menu: Decodable, Identifiable {
    var id: String
    var foods: [Food]
}

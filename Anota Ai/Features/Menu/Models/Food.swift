//
//  Food.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 30/09/22.
//

import Foundation

struct Food: Decodable, Identifiable {
    var id: String
    var name: String
    var type: String
    var price: Double
    var previewUrl: String
    var description: String
}

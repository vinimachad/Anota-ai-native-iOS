//
//  Review.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 28/09/22.
//

import Foundation

struct Review: Decodable, Identifiable {
    var id: String
    var points: Int
    var description: String
}

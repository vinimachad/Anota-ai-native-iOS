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
    var price: String
    var previewUrl: String
    var description: String
}

extension Food {
    
    static var sample: Food {
        Food(
            id: "asd",
            name: "Pizza quatro queijos",
            type: "pizza salgada",
            price: "43,33",
            previewUrl: "",
            description: "Marguerita, bacon cremoso, calabresa e portuguesa."
        )
    }
}

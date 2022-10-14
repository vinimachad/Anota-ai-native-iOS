//
//  FoodSection.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 14/10/22.
//

import Foundation

struct FoodSection: Identifiable {
    var id = UUID()
    var title: String
    var foods: [Food]
}

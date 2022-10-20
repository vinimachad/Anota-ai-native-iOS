//
//  ReviewStatus.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 27/09/22.
//

import Foundation

struct ReviewStatus: Identifiable {
    var id = UUID()
    var value: CGFloat
    var stars: Int
}

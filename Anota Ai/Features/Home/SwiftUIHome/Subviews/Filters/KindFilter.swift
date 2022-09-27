//
//  KindFilter.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 26/09/22.
//

import Foundation

enum KindFilter {
    case price
    case evaluation
    case distance
    case config
    
    var title: String {
        switch self {
        case .price: return "Preço"
        case .evaluation: return "Avaliação"
        case .distance: return "Distancia"
        case .config: return "Filtros"
        }
    }
}


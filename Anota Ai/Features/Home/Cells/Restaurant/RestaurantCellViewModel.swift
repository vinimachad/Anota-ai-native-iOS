//
//  RestaurantCellViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 02/09/22.
//

import Foundation

struct RestaurantCellViewModel: RestaurantCellViewModelProtocol {
    
    var previewString: String
    var title: String
    
    var previewURL: URL? {
        URL(string: previewString)
    }
}

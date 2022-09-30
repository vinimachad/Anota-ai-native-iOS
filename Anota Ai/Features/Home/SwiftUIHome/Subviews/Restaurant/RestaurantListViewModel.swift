//
//  RestaurantListViewModl.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 30/09/22.
//

import SwiftUI

class RestaurantListViewModel: ObservableObject {
    
    @Published var opacity: Double = 0.4
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
}

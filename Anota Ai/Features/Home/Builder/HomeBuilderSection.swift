//
//  HomeBuilderSection.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 02/09/22.
//

import Foundation
import CollectionDS_SDK

class HomeBuilderSection: BuilderSectionProtocol {
    
    
    // MARK: - Sections
    
    private func restaurantsSection() -> CollectionSectionProtocol {
        
        return CollectionSection<RestaurantCell>(
            items: [RestaurantCellViewModel(), RestaurantCellViewModel(), RestaurantCellViewModel(), RestaurantCellViewModel(),],
            interItemGap: 16,
            lineGap: 16,
            columns: 4
        )
    }
    
    func builder() -> [CollectionSectionProtocol] {
        [restaurantsSection()]
    }
}

//
//  HomeBuilderSection.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 02/09/22.
//

import Foundation
import CollectionDS_SDK

protocol HomeBuilderSectionProtocol: BuilderSectionProtocol {
    func appendRestaurantSection(with restaurants: [Restaurant])
}

class HomeBuilderSection: HomeBuilderSectionProtocol {
    
    private var builders: [CollectionSectionProtocol] = []
    
    // MARK: - Sections
    
    func appendRestaurantSection(with restaurants: [Restaurant]) {
        let items = restaurants.map { RestaurantCellViewModel(previewString: $0.avatarUrl, title: $0.name) }
        let section = CollectionSection<RestaurantCell>(
            items: items,
            interItemGap: 16,
            lineGap: 16,
            columns: 4,
            headerViewModel: HeaderTitleSupplementaryViewModel(title: "Restaurante")
        )
        
        builders.append(section)
    }
    
    func builder() -> [CollectionSectionProtocol] {
        builders
    }
}

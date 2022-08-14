//
//  CreateAccountSectionBuilder.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 13/08/22.
//

import Foundation
import CollectionDS_SDK

class CreateAccountSectionBuilder: BuilderSectionProtocol {
    
    // MARK: - Sections
    
    private func addressCardCellSection() -> CollectionSectionProtocol {
        return CollectionSection<AddressCardCell>(items: [AddressCardCellViewModel()])
    }
    
    // MARK: - Builder
    
    func builder() -> [CollectionSectionProtocol] {
        [addressCardCellSection()]
    }
}

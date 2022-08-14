//
//  AddressCardCellViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 13/08/22.
//

import Foundation

class AddressCardCellViewModel {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    // MARK: - Init
    
    init() {
        
    }
}

// MARK: - AddressCardCellViewModelProtocol

extension AddressCardCellViewModel: AddressCardCellViewModelProtocol {
    
    var street: String {
        "R. Araras, 187, São Francisco"
    }
    
    var city: String {
        "Campo Grande - MS, 79118-040"
    }
}

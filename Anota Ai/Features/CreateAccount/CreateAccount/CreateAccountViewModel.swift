//
//  CreateAccountViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 13/08/22.
//

import Foundation
import CollectionDS_SDK


protocol CreateAccountProtocol: CreateAccountViewModelProtocol {
    
}

class CreateAccountViewModel {
    
    // MARK: - Public properties
    
    lazy var sections: [CollectionSectionProtocol] = {
        sectionBuilder.builder()
    }()
    
    // MARK: - Private properties
    
    private lazy var sectionBuilder = CreateAccountSectionBuilder()
    
    // MARK: - Init
    
    init() {
        
    }
}

// MARK: - CreateAccountProtocol

extension CreateAccountViewModel: CreateAccountProtocol {
    
}

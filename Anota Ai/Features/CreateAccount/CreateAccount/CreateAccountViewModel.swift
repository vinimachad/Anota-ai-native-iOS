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
    
    public var onButtonStateIsEnable: ((Bool) -> Void)?
    lazy var sections: [CollectionSectionProtocol] = {
        sectionBuilder.builder()
    }()
    
    // MARK: - Private properties
    
    private lazy var sectionBuilder = CreateAccountSectionBuilder(onButtonStateIsEnable: self.didButtonStateIsEnable(_:))
    
    // MARK: - Init
    
    init() {
        
    }
    
    private func didButtonStateIsEnable(_ isEnable: Bool) {
        onButtonStateIsEnable?(isEnable)
    }
}

// MARK: - CreateAccountProtocol

extension CreateAccountViewModel: CreateAccountProtocol {
    
}

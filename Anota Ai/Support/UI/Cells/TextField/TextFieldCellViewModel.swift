//
//  TextFieldCellViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 13/08/22.
//

import Foundation

class TextFieldCellViewModel {
    
    // MARK: - Public properties
    
    var title: String
    
    // MARK: - Private properties
    
    var onChangeText: ((String?) -> Void)?
    
    // MARK: - Init
    
    init(title: String, onChangeText: ((String?) -> Void)?) {
        self.title = title
        self.onChangeText = onChangeText
    }
}

// MARK: - TextFieldCellViewModelProtocol

extension TextFieldCellViewModel: TextFieldCellViewModelProtocol {
    
    func didChangeText(text: String?) {
        onChangeText?(text)
    }
}

//
//  TextFieldCellViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 13/08/22.
//

import Foundation
import UIKit

class TextFieldCellViewModel {
    
    // MARK: - Public properties
    
    var title: String?
    var type: UIKeyboardType
    
    // MARK: - Private properties
    
    var onChangeText: ((String?) -> Void)?
    
    // MARK: - Init
    
    init(title: String?, type: UIKeyboardType, onChangeText: ((String?) -> Void)?) {
        self.title = title
        self.type = type
        self.onChangeText = onChangeText
    }
}

// MARK: - TextFieldCellViewModelProtocol

extension TextFieldCellViewModel: TextFieldCellViewModelProtocol {
    
    func didChangeText(text: String?) {
        onChangeText?(text)
    }
}

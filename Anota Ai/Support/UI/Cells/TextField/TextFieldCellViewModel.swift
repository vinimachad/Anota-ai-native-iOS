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
    var isSecureTextEntry: Bool
    
    // MARK: - Private properties
    
    var onChangeText: ((String?) -> Void)?
    
    // MARK: - Init
    
    init(title: String?, type: UIKeyboardType, isSecureTextEntry: Bool = false, onChangeText: ((String?) -> Void)?) {
        self.title = title
        self.type = type
        self.onChangeText = onChangeText
        self.isSecureTextEntry = false
    }
}

// MARK: - TextFieldCellViewModelProtocol

extension TextFieldCellViewModel: TextFieldCellViewModelProtocol {
    
    func didChangeText(text: String?) {
        onChangeText?(text)
    }
}

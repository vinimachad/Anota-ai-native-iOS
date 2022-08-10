//
//  AlertViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 08/08/22.
//

import Foundation

protocol AlertProtocol: AlertViewModelProtocol {
    var onCancel: (() -> Void)? { get set }
    var onConfirm: (() -> Void)? { get set }
}

class AlertViewModel: AlertProtocol {
    
    var title: String
    var description: String
    var onCancel: (() -> Void)?
    var onConfirm: (() -> Void)?
    
    init(title: String, description: String, onCancel: (() -> Void)?, onConfirm: (() -> Void)?) {
        self.title = title
        self.description = description
        self.onCancel = onCancel
        self.onConfirm = onConfirm
    }
    
    func didTapCancel() {
        onCancel?()
    }
    
    func didTapConfirm() {
        onConfirm?()
    }
}

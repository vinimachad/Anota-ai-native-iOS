//
//  AlertViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 08/08/22.
//

import Foundation

protocol AlertProtocol: AlertViewModelProtocol {
    
}

class AlertViewModel: AlertProtocol {
    
    var title: String
    var description: String
    var actions: [ButtonKit]
    
    init(title: String, description: String, actions: [ButtonKit]) {
        self.title = title
        self.description = description
        self.actions = actions
    }
}

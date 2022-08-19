//
//  LoginViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 19/08/22.
//

import Foundation


protocol LoginProtocol: LoginViewModelProtocol {
    
}

class LoginViewModel {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    // MARK: - Init
    
    init() {
        
    }
}

// MARK: - LoginProtocol

extension LoginViewModel: LoginProtocol {
    func didLogin() {
        
    }
    
    func didChangePassword(_ text: String?) {
        
    }
    
    func didChangeEmail(_ text: String?) {
        
    }
    
    
}

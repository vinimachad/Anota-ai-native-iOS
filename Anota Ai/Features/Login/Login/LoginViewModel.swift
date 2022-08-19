//
//  LoginViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 19/08/22.
//

import Foundation


protocol LoginProtocol: LoginViewModelProtocol {
    var onStartLoading: (() -> Void)? { get set }
    var onSuccessAuthenticate: (() -> Void)? { get set }
    var onFailureAuthenticate: ((String) -> Void)? { get set }
}

class LoginViewModel {
    
    // MARK: - Public properties
    
    var onButtonStateIsEnable: ((Bool) -> Void)?
    var onStartLoading: (() -> Void)?
    var onSuccessAuthenticate: (() -> Void)?
    var onFailureAuthenticate: ((String) -> Void)?
    
    // MARK: - Private properties
    
    private var credentials = Credentials()
    private var authenticateUseCase: AuthenticateUseCaseProtocol
    
    // MARK: - Init
    
    init(authenticateUseCase: AuthenticateUseCaseProtocol) {
        self.authenticateUseCase = authenticateUseCase
    }
    
    private func validateFields() {
        if credentials.isFilled() {
            onButtonStateIsEnable?(true)
            return
        }
        onButtonStateIsEnable?(false)
    }
}

// MARK: - LoginProtocol

extension LoginViewModel: LoginProtocol {
    
    
    func didLogin() {
        authenticateUserRequest()
    }
    
    func didChangePassword(_ text: String?) {
        credentials.password = text ?? ""
        validateFields()
    }
    
    func didChangeEmail(_ text: String?) {
        credentials.email = text ?? ""
        validateFields()
    }
}

extension LoginViewModel {
    
    // MARK: - Requests
    
    func authenticateUserRequest() {
        onStartLoading?()
        
        authenticateUseCase.execute(
            req: credentials,
            success: { [weak self] session in
                self?.saveUserInSession(session)
                self?.onSuccessAuthenticate?()
            },
            failure: { [weak self] message in
                self?.onFailureAuthenticate?(message)
            }
        )
    }
    
    private func saveUserInSession(_ userSession: UserSession) {
        UserSessionManager.shared.saveUserInSession(userSession, failure: nil)
    }
}

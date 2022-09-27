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
    var onFailureGetUserAddress: (() -> Void)? { get set }
}

class LoginViewModel {
    
    // MARK: - Public properties
    
    var onButtonStateIsEnable: ((Bool) -> Void)?
    var onStartLoading: (() -> Void)?
    var onSuccessAuthenticate: (() -> Void)?
    var onFailureAuthenticate: ((String) -> Void)?
    var onFailureGetUserAddress: (() -> Void)?
    
    // MARK: - Private properties
    
    private var credentials = Credentials()
    private var authenticateUseCase: AuthenticateUseCaseProtocol
    private var userAddressUseCase: UserAddressesUseCase
    
    // MARK: - Init
    
    init(authenticateUseCase: AuthenticateUseCaseProtocol, userAddressUseCase: UserAddressesUseCase) {
        self.authenticateUseCase = authenticateUseCase
        self.userAddressUseCase = userAddressUseCase
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
                self?.userAddressesRequest(userId: session.id)
            },
            failure: { [weak self] message in
                self?.onFailureAuthenticate?(message)
            }
        )
    }
    
    func userAddressesRequest(userId: String) {
        onStartLoading?()
        let userAddressRequest = UserAddressRequest(userId: userId)
        
        self.userAddressUseCase.execute(
            request: userAddressRequest,
            success: { [weak self] userAddress in
                UserSessionManager.shared.setUserHasAddress(!userAddress.isEmpty)
                self?.onSuccessAuthenticate?()
            },
            failure: { [weak self] error in
                self?.onFailureGetUserAddress?()
            }
        )
    }
    
    private func saveUserInSession(_ userSession: UserSession) {
        UserSessionManager.shared.saveUserInSession(userSession, failure: nil)
    }
}

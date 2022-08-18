//
//  CreateAccountViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 13/08/22.
//

import Foundation
import CollectionDS_SDK


protocol CreateAccountProtocol: CreateAccountViewModelProtocol {
    var onSuccessCreateUser: (() -> Void)? { get set }
    var onFailureCreateUser: ((String) -> Void)? { get set }
    var onFailureSaveUserInSession: ((String) -> Void)? { get set }
}

class CreateAccountViewModel {
    
    // MARK: - Public properties
    
    var onButtonStateIsEnable: ((Bool) -> Void)?
    var onSuccessCreateUser: (() -> Void)?
    var onFailureCreateUser: ((String) -> Void)?
    var onFailureSaveUserInSession: ((String) -> Void)?
    
    lazy var sections: [CollectionSectionProtocol] = {
        sectionBuilder.builder()
    }()
    
    // MARK: - Private properties
    
    private var userRequest = UserRequest()
    private var createUserAccountUseCase: CreateUserAccountUseCaseProtocol
    
    private lazy var sectionBuilder = CreateAccountSectionBuilder(
        onButtonStateIsEnable: self.didButtonStateIsEnable(_:),
        onCreateAccountFields: self.fillUserRequest(_:)
    )
    
    // MARK: - Init
    
    init(createUserAccountUseCase: CreateUserAccountUseCaseProtocol) {
        self.createUserAccountUseCase = createUserAccountUseCase
    }
}

// MARK: - CreateAccountProtocol

extension CreateAccountViewModel: CreateAccountProtocol {
    
    func didCreateAccount() {
        createUserAccountRequest()
    }
}

// MARK: - Private methods

extension CreateAccountViewModel {
    
    // MARK: - Updates
    
    private func didButtonStateIsEnable(_ isEnable: Bool) {
        onButtonStateIsEnable?(isEnable)
    }
    
    private func fillUserRequest(_ fields: CreateAccountSectionBuilder.Fields) {

        userRequest.name = fields.name
        userRequest.lastName = fields.lastName
        userRequest.email = fields.email
        userRequest.password = fields.password
    }
    
    // MARK: - Requests
    
    private func createUserAccountRequest() {
        
        createUserAccountUseCase.execute(
            req: userRequest,
            success: { [weak self] userSession in
                self?.saveUserInSession(userSession)
                self?.onSuccessCreateUser?()
            },
            failure: { [weak self] message in
                self?.onFailureCreateUser?(message)
            }
        )
    }
    
    private func saveUserInSession(_ userSession: UserSession) {
        do {
            try UserSessionManager.shared.createUserSession(user: userSession)
            UserSessionManager.shared.setUserHasAddress(false)
            UserSessionManager.shared.setIsLoggedIn(true)
        } catch {
            onFailureSaveUserInSession?("Não foi possivel salvar sua sessão")
        }
    }
}

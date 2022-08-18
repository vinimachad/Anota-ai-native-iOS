//
//  CreateUserAccountUseCase.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 18/08/22.
//

import Foundation

protocol CreateUserAccountUseCaseProtocol {
    typealias Success = ((UserSession) -> Void)?
    typealias Failure = ((String) -> Void)?
    
    func execute(req: UserRequest, success: Success, failure: Failure)
}

class CreateUserAccountUseCase: CreateUserAccountUseCaseProtocol {
    
    // MARK: - Private properties
    
    private var api: UserRoutesProtocol
    
    // MARK: - Init
    
    init(api: UserRoutesProtocol) {
        self.api = api
    }
    
    func execute(req: UserRequest, success: Success, failure: Failure) {
        api.createAccount(request: req, completion: { result in
            switch result {
            case .success(let res):
                do {
                    let user = try res.data.decode(type: UserSession.self)
                    success?(user)
                } catch {
                    failure?("Erro ao decodar objeto")
                }
            case .failure(let error):
                failure?(error.localizedDescription)
            }
        })
    }
}

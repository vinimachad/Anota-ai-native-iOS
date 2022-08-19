//
//  AuthenticateUseCase.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 19/08/22.
//

import Foundation

protocol AuthenticateUseCaseProtocol {
    typealias Success = ((UserSession) -> Void)?
    typealias Failure = ((String) -> Void)?
    
    func execute(req: Credentials, success: Success, failure: Failure)
}

class AuthenticateUseCase: AuthenticateUseCaseProtocol {
    
    // MARK: - Private properties
    
    private var api: UserRoutesProtocol
    
    // MARK: - Init
    
    init(api: UserRoutesProtocol) {
        self.api = api
    }
    
    func execute(req: Credentials, success: Success, failure: Failure) {
        DispatchQueue.global().async { [weak self] in
            
            self?.api.authenticate(request: req, completion: { result in
                
                DispatchQueue.main.async {
                    switch result {
                    case .success(let res):
                        do {
                            let session = try res.data.decode(type: UserSession.self)
                            success?(session)
                        } catch {
                            failure?("Erro ao decodar objeto")
                        }
                    case .failure(let error):
                        failure?(error.localizedDescription)
                    }
                }
            })
        }
    }
}

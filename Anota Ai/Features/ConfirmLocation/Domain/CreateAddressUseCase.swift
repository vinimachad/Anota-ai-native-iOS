//
//  CreateAddressUseCase.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 19/08/22.
//

import Foundation

protocol CreateAddressUseCaseProtocol {
    typealias Success = (() -> Void)?
    typealias Failure = ((String) -> Void)?
    
    func execute(req: Address, success: Success, failure: Failure)
}

class CreateAddressUseCase: CreateAddressUseCaseProtocol {
    
    // MARK: - Private properties
    
    private var api: LocationRoutesProtocol
    
    // MARK: - Init
    
    init(api: LocationRoutesProtocol) {
        self.api = api
    }
    
    func execute(req: Address, success: Success, failure: Failure) {
        DispatchQueue.global().async { [weak self] in
            
            self?.api.createAddress(req: req, completion: { result in
                
                DispatchQueue.main.async {
                    switch result {
                    case .success: success?()
                    case .failure(let error): failure?(error.localizedDescription)
                    }
                }
            })
        }
    }
}

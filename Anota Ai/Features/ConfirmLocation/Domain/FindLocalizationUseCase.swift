//
//  FindLocalizationUseCase.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 19/08/22.
//

import Foundation

protocol FindLocalizationUseCaseProtocol {
    typealias Success = ((Address) -> Void)?
    typealias Failure = ((String) -> Void)?
    
    func execute(req: Coordinate, success: Success, failure: Failure)
}

class FindLocalizationUseCase: FindLocalizationUseCaseProtocol {
    
    // MARK: - Private properties
    
    private var api: LocationRoutesProtocol
    
    // MARK: - Init
    
    init(api: LocationRoutesProtocol) {
        self.api = api
    }
    
    func execute(req: Coordinate, success: Success, failure: Failure) {
        DispatchQueue.global(qos: .userInitiated).async {
            
            self.api.findAddress(req: req, completion: { result in
                
                DispatchQueue.main.async {
                    switch result {
                    case .success(let res):
                        do {
                            let address = try res.data.decode(type: Address.self)
                            success?(address)
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

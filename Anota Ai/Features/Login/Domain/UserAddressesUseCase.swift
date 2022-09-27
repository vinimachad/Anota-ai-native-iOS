//
//  UserAddressesUseCase.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 25/09/22.
//

import Foundation

class UserAddressesUseCase: UseCaseFactoryProtocol {
    
    // MARK: - Private properties
    
    private let api: LocationRoutesProtocol
    
    // MARK: - Init
    
    init(api: LocationRoutesProtocol) {
        self.api = api
    }
    
    // MARK: - Execute
    
    func execute(request: UserAddressRequest, success: Success<UserAddress>?, failure: Failure?) {
        api.userAddresses(req: request, completion: { result in
            
            switch result {
            case .success(let res):
                
                do {
                    let userAddresses = try res.data.decode(type: UserAddress.self)
                    success?(userAddresses)
                } catch let error {
                    failure?(error)
                }
                
            case .failure(let error):
                failure?(error)
            }
            
        })
    }
}

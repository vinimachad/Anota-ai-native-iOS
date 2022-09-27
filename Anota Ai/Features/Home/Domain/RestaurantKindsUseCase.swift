//
//  RestaurantKindsUseCase.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 16/09/22.
//

import Foundation

protocol RestaurantKindsUseCaseProtocol {
    typealias Success = (([RestaurantKind]) -> Void)
    typealias Failure = ((Error) -> Void)
    
    func execute(success: Success?, failure: Failure?)
}

class RestaurantKindsUseCase: RestaurantKindsUseCaseProtocol {
    
    // MARK: - Private properties
    
    private var api: RestaurantRoutesProtocol
    
    // MARK: - Init
    
    init(api: RestaurantRoutesProtocol) {
        self.api = api
    }
    
    func execute(success: Success?, failure: Failure?) {
        self.api.restaurantKinds { result in
            
            switch result {
            case .success(let res):
                
                do {
                    let kinds = try res.data.decode(type: [RestaurantKind].self)
                    success?(kinds)
                } catch let error {
                    failure?(error)
                }
                
            case .failure(let error):
                failure?(error)
            }
        }
    }
}



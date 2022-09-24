//
//  BestRatedRestaurantUseCase.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 23/09/22.
//

import Foundation

class BestRatedRestaurantUseCase: UseCaseFactoryProtocol {
    
    // MARK: - Private properties
    
    private var api: RestaurantRoutesProtocol
    
    // MARK: - Init
    
    init(api: RestaurantRoutesProtocol) {
        self.api = api
    }
    
    func execute(success: Success<[Restaurant]>?, failure: Failure?) {
        api.bestRated(completion: { result in
            switch result {
            case .success(let res):
                
                do {
                    let restaurants = try res.data.decode(type: [Restaurant].self)
                    success?(restaurants)
                } catch let error {
                    failure?(error)
                }
                
            case .failure(let error):
                failure?(error)
            }
        })
    }
}

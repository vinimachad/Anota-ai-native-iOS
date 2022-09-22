//
//  NearRestaurantUseCase.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 22/09/22.
//

import Foundation

class NearRestaurantUseCase: UseCaseFactoryProtocol {
    
    // MARK: - Private properties
    
    private var api: RestaurantRoutes
    
    // MARK: - Init
    
    init(api: RestaurantRoutes) {
        self.api = api
    }
    
    func execute(request: Coordinate, success: Success<[Restaurant]>?, failure: Failure?) {
        api.near(coordinate: request, completion: { result in
            
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

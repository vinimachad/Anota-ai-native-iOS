//
//  FindRestaurantsUseCase.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 02/09/22.
//

import Foundation

protocol FindRestaurantsUseCaseProtocol {
    
    typealias Callback<T: Any> = ((T) -> Void)?
    
    func execute(success: Callback<[Restaurant]>, failure: Callback<String>)
}

class FindRestaurantsUseCase: FindRestaurantsUseCaseProtocol {
    
    // MARK: - Private properties
    
    private let api: RestaurantRoutesProtocol
    
    // MARK: - Init
    
    init(api: RestaurantRoutesProtocol) {
        self.api = api
    }
    
    func execute(success: Callback<[Restaurant]>, failure: Callback<String>) {
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
            self?.api.findRestaurants { result in
                
                DispatchQueue.main.async {
                    switch result {
                    case .success(let res):
                        
                        do {
                            let restaurants = try res.data.decode(type: [Restaurant].self)
                            success?(restaurants)
                        } catch let error {
                            failure?(error.localizedDescription)
                        }
                        
                    case .failure(let error):
                        failure?(error.localizedDescription)
                    }
                }
            }
        }
    }
}

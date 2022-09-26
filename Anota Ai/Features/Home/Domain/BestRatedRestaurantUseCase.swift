//
//  BestRatedRestaurantUseCase.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 23/09/22.
//

import Foundation
import Combine

class BestRatedRestaurantUseCase: UseCaseFactoryProtocol {
    
    // MARK: - Private properties
    
    private var api: RestaurantRoutesProtocol
    
    // MARK: - Init
    
    init(api: RestaurantRoutesProtocol) {
        self.api = api
    }
    
    func execute() -> AnyPublisher<[Restaurant], APIError> {
        return api.bestRated()
            .tryMap { response -> Data in
                let httpURLResponse = response.response
                guard httpURLResponse?.statusCode == 200 else {
                    throw APIError.statusCode(httpURLResponse?.statusCode)
                }
                
                return response.data
            }
            .decode(type: [Restaurant].self, decoder: JSONDecoder.defaultJSONDecoder)
            .mapError {
                APIError.map($0)
            }
            .eraseToAnyPublisher()
    }
}

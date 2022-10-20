//
//  RestaurantReviewsUseCase.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 28/09/22.
//

import Combine
import Foundation

protocol RestaurantReviewsUseCaseProtocol: PublisherRequestUseCaseFactoryProtocol where Request == String,  Response == [Review] { }

class RestaurantReviewsUseCase: RestaurantReviewsUseCaseProtocol {
    
    // MARK: - Private properties
    
    private var api: ReviewRoutesProtocol
    
    // MARK: - Init
    
    init(api: ReviewRoutesProtocol) {
        self.api = api
    }
    
    func execute(request: String) -> AnyPublisher<[Review], APIError> {
        api.restaurantReviews(request: request)
            .tryMap({ req in
                if req.statusCode != 200 {
                    throw APIError.statusCode(req.statusCode)
                }
                return req.data
            })
            .decode(type: [Review].self, decoder: JSONDecoder.defaultJSONDecoder)
            .mapError({APIError.map($0)})
            .eraseToAnyPublisher()
    }
}

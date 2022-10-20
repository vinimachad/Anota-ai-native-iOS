//
//  GetMenuUseCase.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 30/09/22.
//

import Foundation
import Combine

protocol GetMenuUseCaseProtocol: PublisherRequestUseCaseFactoryProtocol where Request == String, Response == Menu { }

class GetMenuUseCase: GetMenuUseCaseProtocol {
    
    // MARK: - Private properties
    
    private var api: RestaurantRoutesProtocol
    
    // MARK: - Ini
    
    init(api: RestaurantRoutesProtocol) {
        self.api = api
    }
    
    func execute(request: String) -> AnyPublisher<Menu, APIError> {
        api.menu(request: request)
            .tryMap({ req in
                if req.statusCode != 200 {
                    throw APIError.statusCode(req.statusCode)
                }
                return req.data
            })
            .decode(type: Menu.self, decoder: JSONDecoder.defaultJSONDecoder)
            .mapError({APIError.map($0)})
            .eraseToAnyPublisher()
    }
}

class GetMenuUseCaseMock: GetMenuUseCaseProtocol {
    func execute(request: String) -> AnyPublisher<Menu, APIError> {
        return Result.Publisher(Menu.sample).eraseToAnyPublisher()
    }
}

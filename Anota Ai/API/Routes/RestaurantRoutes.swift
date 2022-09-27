//
//  RestaurantRoutes.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 02/09/22.
//

import Moya
import Combine

protocol RestaurantRoutesProtocol {
    func findRestaurants(completion: @escaping Completion)
    func restaurantKinds(completion: @escaping Completion)
    func near(request: NearRequest, completion: @escaping Completion)
    func bestRated() -> AnyPublisher<Response, MoyaError>
}

class RestaurantRoutes {
    
    var cancellable: AnyCancellable?
    
    enum Target: APITarget {
        
        case findRestaurants
        case restaurantKinds
        case near(NearRequest)
        case bestRated
        
        var path: String {
            switch self {
            case .findRestaurants: return "restaurant"
            case .restaurantKinds: return "restaurant/kinds"
            case .near: return "restaurant/near"
            case .bestRated: return "restaurant/bestRated"
            }
        }
        
        var method: Method {
            switch self {
            case .findRestaurants: return .get
            case .restaurantKinds: return .get
            case .near: return .get
            case .bestRated: return .get
            }
        }
        
        var task: Task {
            switch self {
            case .findRestaurants: return .requestPlain
            case .restaurantKinds: return .requestPlain
            case .near(let request): return .requestParameters(parameters: request.toJson(), encoding: URLEncoding.queryString)
            case .bestRated: return .requestPlain
            }
        }
        
        var headers: [String : String]? {
            sessionHeader()
        }
    }
    
    let provider: MoyaProvider<Target> = APIProvider<Target>().build()
}

extension RestaurantRoutes: RestaurantRoutesProtocol {
    
    func findRestaurants(completion: @escaping Completion) {
        provider.request(.findRestaurants, completion: completion)
    }
    
    func restaurantKinds(completion: @escaping Completion) {
        provider.request(.restaurantKinds, completion: completion)
    }
    
    func near(request: NearRequest, completion: @escaping Moya.Completion) {
        provider.request(.near(request), completion: completion)
    }
    
    func bestRated() -> AnyPublisher<Response, MoyaError> {
       return provider.requestPublisher(.bestRated)
    }
}

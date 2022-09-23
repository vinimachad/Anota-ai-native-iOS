//
//  RestaurantRoutes.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 02/09/22.
//

import Moya

protocol RestaurantRoutesProtocol {
    func findRestaurants(completion: @escaping Completion)
    func restaurantKinds(completion: @escaping Completion)
    func near(request: NearRequest, completion: @escaping Completion)
}

class RestaurantRoutes {
    
    enum Target: APITarget {
        
        case findRestaurants
        case restaurantKinds
        case near(NearRequest)
        
        var path: String {
            switch self {
            case .findRestaurants: return "restaurant"
            case .restaurantKinds: return "restaurant/kinds"
            case .near: return "restaurant/near"
            }
        }
        
        var method: Method {
            switch self {
            case .findRestaurants: return .get
            case .restaurantKinds: return .get
            case .near: return .get
            }
        }
        
        var task: Task {
            switch self {
            case .findRestaurants: return .requestPlain
            case .restaurantKinds: return .requestPlain
            case .near(let request): return .requestParameters(parameters: request.toJson(), encoding: URLEncoding.queryString)
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
}

//
//  RestaurantRoutes.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 02/09/22.
//

import Moya

protocol RestaurantRoutesProtocol {
    func findRestaurants(completion: @escaping Completion)
}

class RestaurantRoutes {
    
    enum Target: APITarget {
        
        case findRestaurants
        
        var path: String {
            switch self {
            case .findRestaurants: return "restaurant"
            }
        }
        
        var method: Method {
            switch self {
            case .findRestaurants: return .get
                
            }
        }
        
        var task: Task {
            switch self {
            case .findRestaurants: return .requestPlain
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
}

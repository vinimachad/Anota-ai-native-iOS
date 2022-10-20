//
//  ReviewRoutes.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 28/09/22.
//

import Moya
import Combine

protocol ReviewRoutesProtocol {
    func restaurantReviews(request: String) -> AnyPublisher<Response, MoyaError>
}

class ReviewRoutes {
    
    enum Target: APITarget {
        
        case restaurantReviews(String)
        
        var path: String {
            switch self {
            case .restaurantReviews: return "evaluation/restaurant"
            }
        }
        
        var method: Moya.Method {
            switch self {
            case .restaurantReviews: return .get
            }
        }
        
        var task: Moya.Task {
            switch self {
            case .restaurantReviews(let id): return .requestParameters(parameters: ["restaurant_id": id], encoding: URLEncoding.queryString)
            }
        }
        
        var headers: [String : String]? {
            sessionHeader()
        }
    }
    
    private var provider: MoyaProvider<Target> = APIProvider<Target>().build()
}

extension ReviewRoutes: ReviewRoutesProtocol {
    
    func restaurantReviews(request: String) -> AnyPublisher<Moya.Response, Moya.MoyaError> {
        provider.requestPublisher(.restaurantReviews(request))
    }
}

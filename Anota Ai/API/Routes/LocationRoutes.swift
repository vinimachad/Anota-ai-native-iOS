//
//  LocationRoutes.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 19/08/22.
//

import Moya

protocol LocationRoutesProtocol {
    func findAddress(req: Coordinate, completion: @escaping Completion)
    func createAddress(req: Address, completion: @escaping Completion)
}

class LocationRoutes {
    
    enum Target: APITarget {
        
        case findAddress(Coordinate)
        case createAddress(Address)
        
        var path: String {
            switch self {
            case .findAddress: return "address"
            case .createAddress: return "address"
            }
        }
        
        var method: Method {
            switch self {
            case .findAddress: return .get
            case .createAddress: return .post
            }
        }
        
        var task: Task {
            switch self {
            case .findAddress(let req): return
            .requestParameters(
                parameters: ["lat": req.lat, "long": req.long],
                encoding: URLEncoding.queryString
            )
            case let .createAddress(req): return .requestCustomJSONEncodable(req, encoder: defaultJSONEncoder)
            }
        }
        
        var headers: [String : String]? {
            sessionHeader()
        }
    }
    
    let provider: MoyaProvider<Target> = APIProvider<Target>().build()
}

extension LocationRoutes: LocationRoutesProtocol {
    
    func findAddress(req: Coordinate, completion: @escaping Completion) {
        provider.request(.findAddress(req), completion: completion)
    }
    
    func createAddress(req: Address, completion: @escaping Completion) {
        provider.request(.createAddress(req), completion: completion)
    }
}

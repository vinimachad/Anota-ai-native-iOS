//
//  LocationRoutes.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 19/08/22.
//

import Moya

protocol LocationRoutesProtocol {
    func findAddress(completion: @escaping Completion)
    func createAddress(req: Address, completion: @escaping Completion)
}

class LocationRoutes {
    
    enum Target: APITarget {
        
        case findAddress
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
            case .findAddress: return .requestPlain
            case let .createAddress(req): return .requestCustomJSONEncodable(req, encoder: defaultJSONEncoder)
            }
        }
    }
    
    let provider: MoyaProvider<Target> = APIProvider<Target>().build()
}

extension LocationRoutes: LocationRoutesProtocol {
    
    func findAddress(completion: @escaping Completion) {
        provider.request(.findAddress, completion: completion)
    }
    
    func createAddress(req: Address, completion: @escaping Completion) {
        provider.request(.createAddress(req), completion: completion)
    }
}

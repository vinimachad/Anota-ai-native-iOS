//
//  LocationRoutes.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 19/08/22.
//

import Moya

protocol LocationRoutesProtocol {
    func findAddress(req: Coordinate, completion: @escaping Completion)
    func createAddress(req: AddressRequest, completion: @escaping Completion)
    func userAddresses(req: UserAddressRequest, completion: @escaping Completion)
}

class LocationRoutes {
    
    enum Target: APITarget {
        
        case findAddress(Coordinate)
        case createAddress(AddressRequest)
        case userAddresses(UserAddressRequest)
        
        var path: String {
            switch self {
            case .findAddress: return "address"
            case .createAddress: return "address"
            case .userAddresses: return "address/user-addresses"
            }
        }
        
        var method: Method {
            switch self {
            case .findAddress: return .get
            case .createAddress: return .post
            case .userAddresses: return .get
            }
        }
        
        var task: Task {
            switch self {
            case .findAddress(let req): return
            .requestParameters(
                parameters: ["lat": req.lat, "long": req.long],
                encoding: URLEncoding.queryString
            )
            case .userAddresses(let req):
                return .requestParameters(parameters: req.toJson(), encoding: URLEncoding.queryString)
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
    
    func createAddress(req: AddressRequest, completion: @escaping Completion) {
        provider.request(.createAddress(req), completion: completion)
    }
    
    func userAddresses(req: UserAddressRequest, completion: @escaping Completion) {
        provider.request(.userAddresses(req), completion: completion)
    }
}

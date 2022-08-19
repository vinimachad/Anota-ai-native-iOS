//
//  UserRoutes.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 18/08/22.
//

import Moya

protocol UserRoutesProtocol {
    func createAccount(request: UserRequest, completion: @escaping Completion)
}

class UserRoutes {
    
    enum Target: APITarget {
        
        case authenticate
        case createAccount(UserRequest)
        
        var path: String {
            switch self {
            case .authenticate: return "login"
            case .createAccount: return "sign-up"
            }
        }
        
        var method: Method {
            switch self {
            case .authenticate: return .post
            case .createAccount: return .post
            }
        }
        
        var task: Task {
            switch self {
            case .authenticate: return .requestPlain
            case .createAccount(let data): return .requestCustomJSONEncodable(data, encoder: defaultJSONEncoder)
            }
        }
    }
    
    let provider: MoyaProvider<Target> = APIProvider<Target>().build()
}

extension UserRoutes: UserRoutesProtocol {
    
    func createAccount(request: UserRequest, completion: @escaping Completion) {
        provider.request(.createAccount(request), completion: completion)
    }
}

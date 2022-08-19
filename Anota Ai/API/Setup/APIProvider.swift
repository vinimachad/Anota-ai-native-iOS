//
//  APIProvider.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 18/08/22.
//

import Moya

struct APIProvider<T: APITarget> {

    func build() -> MoyaProvider<T> {
        return MoyaProvider<T>(
            endpointClosure: { $0.endPoint },
            requestClosure: request(endpoint:result:),
            plugins: plugins()
        )
    }
}

extension APIProvider {

    private func request(endpoint: Endpoint, result: MoyaProvider<T>.RequestResultClosure) {
        var request = try? endpoint.urlRequest()
        request?.cachePolicy = .reloadIgnoringLocalCacheData

        if let request = request {
            result(.success(request))
        }
    }

    private func plugins() -> [PluginType] {
        return [
            NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))
        ]
    }
}

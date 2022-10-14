//
//  APIError.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 26/09/22.
//

import Foundation

enum APIError: Error {
    case statusCode(Int?)
    case decoding(String)
    case other(String)
    
    static func map(_ error: Error) -> APIError {
        print(error)
        return .other(error.localizedDescription)
    }
    
    var message: String {
        switch self {
        case .statusCode(let message): return "Status code \(message ?? 500)"
        case .decoding(let message): return "Falha ao decodar objeto \(message)"
        case .other(let message): return message
        }
    }
}

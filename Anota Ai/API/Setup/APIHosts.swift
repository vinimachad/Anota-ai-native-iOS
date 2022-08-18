//
//  APIHosts.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 18/08/22.
//

import Foundation

enum APIHosts {
    
    static var baseURL: URL {
        let urlString: String
        
        #if DEBUG
        urlString = "http://localhost:8080/"
        #else
        urlString = "http://localhost:8080/"
        #endif
        
        guard let url = URL(string: urlString) else { fatalError("URL não suportada") }
        return url
    }
}

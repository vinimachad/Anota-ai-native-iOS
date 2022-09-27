//
//  RequestState.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 22/09/22.
//

import Foundation

enum RequestState<T: Any> {
    case loading
    case empty
    case failure(String)
    case success(T)
}

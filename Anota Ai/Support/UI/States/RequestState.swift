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

func isEmptyStateValidation<T: Decodable>(state: inout RequestState<[T]>, items: [T]) {
    if items.isEmpty {
        state = .empty
        return
    }
    state = .success(items)
}

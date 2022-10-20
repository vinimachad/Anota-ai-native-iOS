//
//  UseCaseFactoryProtocol.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 22/09/22.
//

import Foundation
import Combine

// MARK: - Protocols

protocol UseCaseFactoryProtocol {
    associatedtype Object = Decodable
    associatedtype Request = Encodable
    
    typealias Success<T: Any> = ((T) -> Void)
    typealias Failure = ((Error) -> Void)
    
    func execute(success: Success<Object.Type>?, failure: Failure?)
    func execute(request: Request, success: Success<Object.Type>?, failure: Failure?)
}

protocol PublisherRequestUseCaseFactoryProtocol {
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request) -> AnyPublisher<Response, APIError>
}

protocol PublisherUseCaseFactoryProtocol {
    associatedtype Response
    func execute() -> AnyPublisher<Response, APIError>
}

// MARK: - Extensions

extension UseCaseFactoryProtocol {
    
    func execute(success: Success<Object.Type>?, failure: Failure?) { }
    func execute(request: Request, success: Success<Object.Type>?, failure: Failure?) { }
}

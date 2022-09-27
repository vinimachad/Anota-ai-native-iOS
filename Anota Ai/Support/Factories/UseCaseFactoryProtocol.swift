//
//  UseCaseFactoryProtocol.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 22/09/22.
//

import Foundation

protocol UseCaseFactoryProtocol {
    associatedtype Object = Decodable
    associatedtype Request = Encodable
    
    typealias Success<T: Any> = ((T) -> Void)
    typealias Failure = ((Error) -> Void)
    
    func execute(success: Success<Object.Type>?, failure: Failure?)
    func execute(request: Request, success: Success<Object.Type>?, failure: Failure?)
}

extension UseCaseFactoryProtocol {
    
    func execute(success: Success<Object.Type>?, failure: Failure?) { }
    func execute(request: Request, success: Success<Object.Type>?, failure: Failure?) { }
}

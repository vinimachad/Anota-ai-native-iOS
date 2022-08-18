//
//  SessionManager.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 17/08/22.
//

import Foundation

protocol UserSessionManagerProtocol {
    static var shared: UserSessionManagerProtocol { get }
    func createUserSession(user: UserSession) throws
    func getUserSession() -> UserSession?
}

class UserSessionManager: UserSessionManagerProtocol {
    
    static var shared: UserSessionManagerProtocol  = UserSessionManager()
    
    private init() { }
    
    func createUserSession(user: UserSession) {
        UserDefaults.standard.createUserSession(user: user)
    }
    
    func getUserSession() -> UserSession? {
        UserDefaults.standard.getUserSession()
    }
}

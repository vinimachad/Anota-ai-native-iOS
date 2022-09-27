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
    func setUserHasAddress(_ hasAddress: Bool)
    func userHasAddress() -> Bool
    func isLoggedIn() -> Bool
    func setIsLoggedIn(_ isLoggedIn: Bool)
    func saveUserInSession(_ userSession: UserSession, failure: ((String) -> Void)?)
}

class UserSessionManager: UserSessionManagerProtocol {
    
    static var shared: UserSessionManagerProtocol  = UserSessionManager()
    
    private init() { }
    
    var hasSession: Bool {
        getUserSession() != nil
    }
    
    func createUserSession(user: UserSession) {
        UserDefaults.standard.createUserSession(user: user)
    }
    
    func getUserSession() -> UserSession? {
        UserDefaults.standard.getUserSession()
    }
    
    // MARK: - Logged in
    
    func isLoggedIn() -> Bool {
        UserDefaults.standard.isLoggedIn()
    }
    
    func setIsLoggedIn(_ isLoggedIn: Bool) {
        UserDefaults.standard.setIsLoggedIn(isLoggedIn: isLoggedIn)
    }
    
    // MARK: - Address
    
    func userHasAddress() -> Bool {
        UserDefaults.standard.userHasAddress()
    }
    
    func setUserHasAddress(_ hasAddress: Bool) {
        UserDefaults.standard.setUserHasAddress(userHasAddress: hasAddress)
    }
    
    func saveUserInSession(_ userSession: UserSession, failure: ((String) -> Void)?) {
        do {
            try UserSessionManager.shared.createUserSession(user: userSession)
            UserSessionManager.shared.setUserHasAddress(false)
            UserSessionManager.shared.setIsLoggedIn(true)
        } catch {
            failure?("not_possible_save_session".localize(.error))
        }
    }
}

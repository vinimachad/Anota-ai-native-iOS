//
//  UserDefaults+Session.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 17/08/22.
//

import Foundation

extension UserDefaults {
    
    private enum UserDefaultsKeys: String {
        case isLoggedIn
        case userSession
        case userHasAddress
    }
    
    // MARK: - Login status
    
    func isLoggedIn() -> Bool {
        bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
    func setIsLoggedIn(isLoggedIn: Bool) {
        set(isLoggedIn, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        synchronize()
    }
    
    func userHasAddress() -> Bool {
        bool(forKey: UserDefaultsKeys.userHasAddress.rawValue)
    }
    
    func setUserHasAddress(userHasAddress: Bool) {
        set(userHasAddress, forKey: UserDefaultsKeys.userHasAddress.rawValue)
        synchronize()
    }
    
    // MARK: - Session
    
    func createUserSession(user: UserSession) {
        let data = try? JSONEncoder().encode(user)
        
        set(data, forKey: UserDefaultsKeys.userSession.rawValue)
        synchronize()
    }
    
    func getUserSession() -> UserSession? {
        guard let data = data(forKey: UserDefaultsKeys.userSession.rawValue) else { return nil }
       
        return try? data.decode(type: UserSession.self)
    }
}

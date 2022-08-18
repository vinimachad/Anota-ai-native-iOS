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
    }
    
    // MARK: - Login status
    
    func isLoggedIn() -> Bool {
        bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
    func setIsLoggedIn(isLoggedIn: Bool) {
        set(isLoggedIn, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        synchronize()
    }
    
    // MARK: - Session
    
    func createUserSession(user: UserSession) {
        let data = try? JSONEncoder().encode(user)
        
        set(data, forKey: UserDefaultsKeys.userSession.rawValue)
        synchronize()
    }
    
    func getUserSession() -> UserSession? {
        let decoder = JSONDecoder()
        guard let data = data(forKey: UserDefaultsKeys.userSession.rawValue) else { return nil }
        do {
            return try decoder.decode(UserSession.self, from: data)
        } catch {
            return nil
        }
    }
}

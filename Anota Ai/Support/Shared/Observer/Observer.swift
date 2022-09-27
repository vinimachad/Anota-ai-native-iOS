//
//  Observer.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 02/09/22.
//

import Foundation

class Observer {
    
    static let shared = Observer()
    
    private init() { }
    
    func bind(name: String, completion: @escaping ((Notification) -> Void)) {
        NotificationCenter.default.addObserver(forName: Notification.Name(name), object: nil, queue: nil, using: completion)
    }
    
    func update(name: String, object: Any? = nil) {
        NotificationCenter.default.post(name: Notification.Name(name), object: object)
    }
}

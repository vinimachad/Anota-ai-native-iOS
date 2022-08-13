//
//  AppDelegate.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/08/22.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    private var appCoordinator: AppCoordinator?
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        self.appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
        IQKeyboardManager.shared.enable = true
        
        return true
    }
}

//
//  UINavigationController+Navigation.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 06/08/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setupDefaultNavigation(title: String = "") {
        self.title = title
        setupDefaultBackButton()
    }
    
    func changeNavigationTintColor(tintColor: UIColor) {
        guard let navBar = navigationController?.navigationBar else { return }
        navBar.tintColor = tintColor
        navBar.titleTextAttributes = [.foregroundColor: tintColor]
    }
    
    func setLeftNavigationButton(action: Selector) {
        let barButtonItem = UIBarButtonItem(image: .Icons.back, style: .plain, target: self, action: action)
        navigationController?.navigationBar.topItem?.setLeftBarButton(barButtonItem, animated: true)
    }
    
    func setupDefaultBackButton() {
        navigationController?.navigationBar.topItem?.title = ""
    }
}

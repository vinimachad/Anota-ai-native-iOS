//
//  UINavigationController+Navigation.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 06/08/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setupDefaultNavigation(title: String = "", navColor: UIColor = .Shapes.shape, isTranslucent: Bool = false) {
        self.title = title
        navigationController?.navigationBar.isTranslucent = isTranslucent
        setupDefaultBackButton()
    }
    
    func changeColorsOfNavigation(tintColor: UIColor, bgColor: UIColor) {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        changeNavigationTintColor(appearance: navBarAppearance, tintColor: tintColor)
        changeNavigationBackgroundColor(appearance: navBarAppearance, color: bgColor)
    }
    
    func setLeftNavigationButton(action: Selector) {
        let barButtonItem = UIBarButtonItem(image: .Icons.back, style: .plain, target: self, action: action)
        navigationController?.navigationBar.topItem?.setLeftBarButton(barButtonItem, animated: true)
    }
    
    func setupDefaultBackButton() {
        navigationItem.backButtonTitle = ""
    }
    
    
    private func changeNavigationTintColor(appearance: UINavigationBarAppearance, tintColor: UIColor) {
        appearance.titleTextAttributes = [.foregroundColor: tintColor]
        appearance.largeTitleTextAttributes = [.foregroundColor: tintColor]
        navigationController?.navigationBar.tintColor = tintColor
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func changeNavigationBackgroundColor(appearance: UINavigationBarAppearance, color: UIColor) {
        appearance.backgroundColor = color
        appearance.shadowColor = .clear
        appearance.shadowImage = UIImage()
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}

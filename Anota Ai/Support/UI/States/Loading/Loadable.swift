//
//  Loadable.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 06/08/22.
//

import Foundation
import UIKit
import SnapKit

protocol Loadable {
    func showLoading()
    func hideLoading()
}

extension Loadable where Self: UIViewController {
    
    private func findLoadingView() -> LoadingView? {
        return view.subviews.compactMap { $0 as? LoadingView }.first
    }
    
    private func addLoadingView() -> LoadingView {
        let loadingView = LoadingView()
        view.addSubview(loadingView)
        loadingView.snp.makeConstraints { $0.edges.equalTo(0) }
        loadingView.startAnimatingActivityIndicator()
        return loadingView
    }
    
    func showLoading() {
        if let loadingView = findLoadingView() {
            view.bringSubviewToFront(loadingView)
            loadingView.startAnimatingActivityIndicator()
            return
        }
        
        view.addSubview(addLoadingView())
    }
    
    func hideLoading() {
        guard let loadingView = findLoadingView() else { return }
        
        loadingView.stopAnimatingActivityIndicator()
        loadingView.removeFromSuperview()
    }
}

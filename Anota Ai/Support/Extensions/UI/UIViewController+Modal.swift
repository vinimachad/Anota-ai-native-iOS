//
//  UIViewController+Modal.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 08/08/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showModal(delegate: UIViewControllerTransitioningDelegate?, viewModel: AlertViewModel) {
        let controller = AlertController(viewModel: viewModel)
        controller.modalPresentationStyle = .custom
        controller.transitioningDelegate = delegate
        navigationController?.present(controller, animated: true)
    }
}

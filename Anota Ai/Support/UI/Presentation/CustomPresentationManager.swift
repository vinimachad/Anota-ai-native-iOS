//
//  CustomPresentationManager.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 09/08/22.
//

import Foundation
import UIKit

class CustomPresentationManager: NSObject, UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        CustomPresentation(presentedViewController: presented, presenting: presenting)
    }
}

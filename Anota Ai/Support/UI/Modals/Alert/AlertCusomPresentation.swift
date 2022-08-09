//
//  AlertCusomPresentation.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 08/08/22.
//

import Foundation
import UIKit

class AlertCustomPresentation: NSObject, UIViewControllerTransitioningDelegate {
    
    func presentationController(
        forPresented presented: UIViewController,
        presenting: UIViewController?,
        source: UIViewController
    ) -> UIPresentationController? {
        
        AlertPresentationController(presentedViewController: presented, presenting: presenting)
    }
}

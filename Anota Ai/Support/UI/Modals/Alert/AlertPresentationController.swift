//
//  AlertPresentationController.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 08/08/22.
//

import Foundation
import UIKit
import SnapKit

class AlertPresentationController: CustomPresentation {
    
    override func frameOfPresentedView() -> CGRect {
        let frame = containerView?.frame ?? CGRect()
        let posX = (frame.width - 328)/2
        let posY = (frame.height - 295)/2
        
        return CGRect(x: posX, y: posY, width: 328, height: 295)
    }
}

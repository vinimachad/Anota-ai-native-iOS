//
//  AlertPresentationController.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 08/08/22.
//

import Foundation
import UIKit
import SnapKit

class AlertPresentationController: UIPresentationController {
    
    // MARK: - Properties
    
    private var dimmingView: UIView!
    
    // MARK: - Init
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        setupDimmingView()
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        centerInMiddle()
    }

    override func presentationTransitionWillBegin() {
        guard let dimmingView = dimmingView else {
            return
        }
        
        containerView?.insertSubview(dimmingView, at: 0)
        
        dimmingView.snp.makeConstraints { $0.edges.equalTo(0) }
        
        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.alpha = 1.0
            return
        }
        
        coordinator.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 0.5
        })
    }
    
    override func dismissalTransitionWillBegin() {
      guard let coordinator = presentedViewController.transitionCoordinator else {
        dimmingView.alpha = 0.0
        return
      }

      coordinator.animate(alongsideTransition: { _ in
        self.dimmingView.alpha = 0.0
      })
    }
    
    override func containerViewWillLayoutSubviews() {
      presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        parentSize
    }
}


extension AlertPresentationController {
    
    private func setupDimmingView() {
        dimmingView = UIView()
        dimmingView.translatesAutoresizingMaskIntoConstraints = false
        dimmingView.backgroundColor = .black
        dimmingView.alpha = 0.1
        
        let recognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(handleTap(recognizer:)))
        dimmingView.addGestureRecognizer(recognizer)
    }
    
    @objc func handleTap(recognizer: UITapGestureRecognizer) {
        presentingViewController.dismiss(animated: true)
    }
    
    private func centerInMiddle() -> CGRect {
        let frame = containerView?.frame ?? CGRect()
        let posX = (frame.width - 328)/2
        let posY = (frame.height - 295)/2
        
        return CGRect(x: posX, y: posY, width: 328, height: 295)
    }
}

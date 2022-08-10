//
//  CustomPresentation.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 09/08/22.
//

import Foundation
import UIKit
import SnapKit

protocol CustomPresentationProtocol {
    var dimmingView: DimmingView { get set }
    func frameOfPresentedView() -> CGRect
}

class CustomPresentation: UIPresentationController, CustomPresentationProtocol {
    
    // MARK: - UI components
    
    lazy var dimmingView: DimmingView = DimmingView()
    
    // MARK: - Init
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        setupDimmingView()
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        frameOfPresentedView()
    }
    
    override func presentationTransitionWillBegin() {
        containerView?.insertSubview(dimmingView, at: 0)
        dimmingView.snp.makeConstraints { $0.edges.equalTo(0) }
    }
    
    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        parentSize
    }
    
    func frameOfPresentedView() -> CGRect {
        return .zero
    }
}


extension CustomPresentation {
    
    private func setupDimmingView() {
        dimmingView.onDismissPresentation = { [weak self] in
            self?.presentingViewController.dismiss(animated: true)
        }
    }
}

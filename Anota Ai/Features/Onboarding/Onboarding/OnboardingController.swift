//
//  OnboardingController.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/08/22.
//

import Foundation
import UIKit

class OnboardingController<ViewModel: OnboardingProtocol>: UIViewController {
    
    // MARK: - Private properties
    
    private let contentView: OnboardingView
    private var viewModel: ViewModel
    
    // MARK: - Init
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        contentView = OnboardingView()
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        startExplanationLoop()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopExplanationLoop()
    }
    
    // MARK: - Loop
    
    private func startExplanationLoop() {
        viewModel.didChangeCurrentExplanation(IndexPath(row: 1, section: 0))
        perform(#selector(displayExplanation), with: nil, afterDelay: 5)
    }
    
    private func stopExplanationLoop() {
        NSObject.cancelPreviousPerformRequests(withTarget: self)
    }
    
    @objc private func displayExplanation() {
        startExplanationLoop()
    }
}

// MARK: - Bind

extension OnboardingController {
    
    private func bind() {
        contentView.bindIn(viewModel: viewModel)
    }
}

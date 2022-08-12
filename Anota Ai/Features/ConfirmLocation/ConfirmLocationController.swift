//
//  ConfirmLocationController.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 12/08/22.
//

import Foundation
import UIKit

class ConfirmLocationController<ViewModel: ConfirmLocationProtocol>: UIViewController {
    
    // MARK: - Private properties
    
    private let contentView: ConfirmLocationView
    private var viewModel: ViewModel
    
    // MARK: - Init
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        contentView = ConfirmLocationView()
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
        setupNavigation()
    }
    
    // MARK: - Navigation
    
    private func setupNavigation() {
        setupDefaultNavigation(title: "confirm_location_title".localize(.confirmLocation))
        changeNavigationTintColor(tintColor: .Brand.secondary)
    }
}

// MARK: - Bind

extension ConfirmLocationController {
    
    private func bind() {
        contentView.bindIn(viewModel: viewModel)
    }
}

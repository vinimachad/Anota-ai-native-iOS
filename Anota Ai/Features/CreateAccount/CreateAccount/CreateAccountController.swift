//
//  CreateAccountController.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 13/08/22.
//

import Foundation

import Foundation
import UIKit

class CreateAccountController<ViewModel: CreateAccountProtocol>: UIViewController {
    
    // MARK: - Private properties
    
    private let contentView: CreateAccountView
    private var viewModel: ViewModel
    
    // MARK: - Init
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        contentView = CreateAccountView()
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupDefaultNavigation()
        changeColorsOfNavigation(tintColor: .Brand.secondary, bgColor: .Shapes.shape)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
}

// MARK: - Bind

extension CreateAccountController {
    
    private func bind() {
        contentView.bindIn(viewModel: viewModel)
    }
}

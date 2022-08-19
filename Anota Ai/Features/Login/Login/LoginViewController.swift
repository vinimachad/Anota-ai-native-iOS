//
//  LoginViewController.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 19/08/22.
//

import Foundation

import Foundation
import UIKit

class LoginController<ViewModel: LoginProtocol>: UIViewController {
    
    // MARK: - Private properties
    
    private let contentView: LoginView
    private var viewModel: ViewModel
    private var scrollView: ScrollView
    
    // MARK: - Init
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        contentView = LoginView()
        scrollView = ScrollView(contentView: contentView)
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func loadView() {
        super.loadView()
        view = scrollView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
}

// MARK: - Bind

extension LoginController {
    
    private func bind() {
        contentView.bindIn(viewModel: viewModel)
    }
}

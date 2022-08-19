//
//  LoginViewController.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 19/08/22.
//

import Foundation

import Foundation
import UIKit

protocol LoginControllerDelegate: AnyObject {
    func presentHome()
}

class LoginController<ViewModel: LoginProtocol>: UIViewController {
    
    // MARK: - Private properties
    
    private let contentView: LoginView
    private var viewModel: ViewModel
    private var scrollView: ScrollView
    private weak var delegate: LoginControllerDelegate?
    
    // MARK: - Init
    
    init(viewModel: ViewModel, delegate: LoginControllerDelegate?) {
        self.viewModel = viewModel
        self.delegate = delegate
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupDefaultNavigation(title: "login_title".localize(.login))
        changeColorsOfNavigation(tintColor: .Brand.secondary, bgColor: .Shapes.shape)
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

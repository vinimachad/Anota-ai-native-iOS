//
//  CreateAccountController.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 13/08/22.
//

import Foundation

import Foundation
import UIKit

protocol CreateAccountControllerDelegate: AnyObject {
    func presetFindYourLocation()
}

class CreateAccountController<ViewModel: CreateAccountProtocol>: UIViewController {
    
    // MARK: - Private properties
    
    private let contentView: CreateAccountView
    private var viewModel: ViewModel
    private weak var delegate: CreateAccountControllerDelegate?
    lazy private var modalPresentingDelegate = AlertPresentationManager()
    
    // MARK: - Init
    
    init(viewModel: ViewModel, delegate: CreateAccountControllerDelegate?) {
        self.viewModel = viewModel
        self.delegate = delegate
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
    
    private func showFailureModal(_ title: String, _ description: String) {
        let action = Button(title: "confirm_title_button".localize(.default), kind: .confirm, onTapButton: { [weak self] in
            self?.navigationController?.dismiss(animated: true)
        })
        let viewModel = AlertViewModel(title: title, description: description, actions: [action])
        self.showModal(delegate: modalPresentingDelegate, viewModel: viewModel)
    }
}

// MARK: - Bind

extension CreateAccountController {
    
    private func bind() {
        contentView.bindIn(viewModel: viewModel)
        
        viewModel.onSuccessCreateUser = { [weak self] in
            self?.delegate?.presetFindYourLocation()
        }
        
        viewModel.onFailureCreateUser = { [weak self] message in
            self?.showFailureModal("Não foi possível criar sua conta", message)
        }
        
        viewModel.onFailureSaveUserInSession = { [weak self] message in
            self?.showFailureModal("Opps...", message)
        }
    }
}

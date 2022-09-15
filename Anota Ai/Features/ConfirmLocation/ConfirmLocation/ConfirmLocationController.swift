//
//  ConfirmLocationController.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 12/08/22.
//

import Foundation
import UIKit

protocol ConfirmLocationControllerDelegate: AnyObject {
    func presentHome()
}

class ConfirmLocationController<ViewModel: ConfirmLocationProtocol>: UIViewController, Loadable {
    
    // MARK: - Private properties
    
    private let scrollView: ScrollViewKit
    private let contentView: ConfirmLocationView
    private var viewModel: ViewModel
    private weak var delegate: ConfirmLocationControllerDelegate?
    private lazy var presentingDelegate = AlertPresentationManager()
    
    // MARK: - Init
    
    init(viewModel: ViewModel, delegate: ConfirmLocationControllerDelegate?) {
        self.viewModel = viewModel
        self.delegate = delegate
        contentView = ConfirmLocationView()
        self.scrollView = ScrollViewKit(contentView: self.contentView)
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
        setupNavigation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.validateFields()
        self.viewModel.findLocateRequest()
    }
    
    // MARK: - Navigation
    
    private func setupNavigation() {
        setupDefaultNavigation(title: "confirm_location_title".localize(.confirmLocation))
        changeColorsOfNavigation(tintColor: .Brand.secondary, bgColor: .Shapes.shape)
    }
    
    // MARK: - Dialog
    
    private func showAlert(description: String) {
        let viewModel = AlertViewModel(
            title: "title_error".localize(.error),
            description: description,
            actions: [ButtonKit(title: "confirm_title_button".localize(.default), kind: .confirm, onTapButton: didConfirm)]
        )
        showModal(delegate: presentingDelegate, viewModel: viewModel)
    }
    
    @objc private func didConfirm() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Bind

extension ConfirmLocationController {
    
    private func bind() {
        
        self.contentView.bindIn(viewModel: self.viewModel)
        
        self.viewModel.onStartLoading = { [weak self] in
            self?.showLoading()
        }
        
        self.viewModel.onSuccessFindLocation = { [weak self] in
            self?.hideLoading()
        }
        
        self.viewModel.onFailureFindLocation = { [weak self] message in
            self?.hideLoading()
            self?.showAlert(description: message)
        }
        
        self.viewModel.onSuccessCreateAddress = { [weak self] in
            self?.hideLoading()
            self?.delegate?.presentHome()
        }
        
        self.viewModel.onFailureCreateAddress = { [weak self] message in
            self?.hideLoading()
            self?.showAlert(description: message)
        }
    }
}

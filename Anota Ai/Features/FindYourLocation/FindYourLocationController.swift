//
//  FindYourLocationController.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 05/08/22.
//


import CoreLocation
import Foundation
import UIKit

protocol FindYourLocationControllerDelegate: AnyObject {
    func returnNavigation()
    func pushConfirmLocalization(_ location: CLLocationCoordinate2D)
}

class FindYourLocationController<ViewModel: FindYourLocationProtocol>: UIViewController, Loadable {
    
    // MARK: - Private properties
    
    private let contentView: FindYourLocationView
    private var viewModel: ViewModel
    private weak var delegate: FindYourLocationControllerDelegate?
    lazy var transitionDelegate = AlertPresentationManager()
    
    // MARK: - Init
    
    init(viewModel: ViewModel, delegate: FindYourLocationControllerDelegate?) {
        self.viewModel = viewModel
        self.delegate = delegate
        contentView = FindYourLocationView()
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
        setupNavigation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        setupNavigation()
        viewModel.requestLocationAuthorization()
    }
    
    // MARK: - Navigation
    
    private func setupNavigation() {
        setBackButton()
        changeNavigationTintColor(tintColor: .Shapes.shape)
        setupDefaultNavigation(title: "your_location_title".localize(.findYourLocation))
    }
    
    private func setBackButton() {
        setLeftNavigationButton(action: #selector(didTapReturnNavigation))
    }
    
    private func showFailureModal() {
        let viewModel = AlertViewModel(
            title: "localization_permission_error_title".localize(.error),
            description: "localization_permission_error_body".localize(.error),
            actions: [Button(title: "confirm_title_button".localize(.default), kind: .confirm, onTapButton: didConfirm)]
        )
        showModal(delegate: transitionDelegate, viewModel: viewModel)
    }
    
    // MARK: - Actions
    
    @objc private func didTapReturnNavigation() {
        self.delegate?.returnNavigation()
    }
    
    @objc private func didConfirm() {
        navigationController?.dismiss(animated: true)
        self.delegate?.returnNavigation()
    }
}

// MARK: - Bind

extension FindYourLocationController {
    
    private func bind() {
        contentView.bindIn(viewModel: viewModel)
        
        viewModel.onFailureGetAuthorization = { [weak self] in
            self?.showFailureModal()
        }
        
        viewModel.onSuccessGetLocalization = { [weak self] location in
            self?.delegate?.pushConfirmLocalization(location)
        }
    }
}

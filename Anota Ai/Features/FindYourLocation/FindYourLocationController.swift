//
//  FindYourLocationController.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 05/08/22.
//


import CoreLocation
import Foundation
import UIKit

class FindYourLocationController<ViewModel: FindYourLocationProtocol>: UIViewController, Loadable {
    
    // MARK: - Private properties
    
    private let contentView: FindYourLocationView
    private var viewModel: ViewModel
    
    // MARK: - Init
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
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
        showLoading()
    }
    
    // MARK: - Navigation
    
    private func setupNavigation() {
        setBackButton()
        changeNavigationTintColor(tintColor: .Shapes.shape)
        setupDefaultNavigation(title: "Confirmar sua localização")
    }
    
    private func setBackButton() {
        setLeftNavigationButton(action: #selector(didTapReturnNavigation))
    }
    
    // MARK: - Actions
    
    @objc private func didTapReturnNavigation() {
        print("as")
    }
}

// MARK: - Bind

extension FindYourLocationController {
    
    private func bind() {
        contentView.bindIn(viewModel: viewModel)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.hideLoading()
        }
    }
}

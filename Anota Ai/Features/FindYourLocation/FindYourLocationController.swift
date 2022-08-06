//
//  FindYourLocationController.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 05/08/22.
//


import CoreLocation
import Foundation
import UIKit

class FindYourLocationController<ViewModel: FindYourLocationProtocol>: UIViewController, CLLocationManagerDelegate {
    
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
//        viewModel.requestLocationAuthorization(delegate: self)
    }
    
    private func setupNavigation() {
        navigationController?.modalPresentationStyle = .pageSheet
    }
}

// MARK: - Bind

extension FindYourLocationController {
    
    private func bind() {
        contentView.bindIn(viewModel: viewModel)
    }
}

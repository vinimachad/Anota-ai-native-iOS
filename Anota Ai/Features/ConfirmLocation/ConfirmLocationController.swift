//
//  ConfirmLocationController.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 12/08/22.
//

import Foundation
import UIKit

protocol ConfirmLocationControllerDelegate: AnyObject {
    
}

class ConfirmLocationController<ViewModel: ConfirmLocationProtocol>: UIViewController {
    
    // MARK: - Private properties
    
    private let scrollView: ScrollView
    private let contentView: ConfirmLocationView
    private var viewModel: ViewModel
    private weak var delegate: ConfirmLocationControllerDelegate?
    
    // MARK: - Init
    
    init(viewModel: ViewModel, delegate: ConfirmLocationControllerDelegate?) {
        self.viewModel = viewModel
        self.delegate = delegate
        contentView = ConfirmLocationView()
        self.scrollView = ScrollView(contentView: self.contentView)
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
    }
    
    // MARK: - Navigation
    
    private func setupNavigation() {
        setupDefaultNavigation(title: "confirm_location_title".localize(.confirmLocation))
        changeColorsOfNavigation(tintColor: .Brand.secondary, bgColor: .Shapes.shape)
    }
}

// MARK: - Bind

extension ConfirmLocationController {
    
    private func bind() {
        contentView.bindIn(viewModel: viewModel)
        
        viewModel.onSaveAddress = { [weak self] in
            
        }
    }
}

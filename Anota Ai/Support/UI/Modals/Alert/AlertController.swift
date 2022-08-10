//
//  AlertController.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 08/08/22.
//

import Foundation

import Foundation
import UIKit

class AlertController<ViewModel: AlertProtocol>: UIViewController {
    
    // MARK: - Private properties
    
    private let contentView: AlertView
    private var viewModel: ViewModel
    
    // MARK: - Init
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        contentView = AlertView()
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
    }
}

// MARK: - Bind

extension AlertController {
    
    private func bind() {
        contentView.bindIn(viewModel: viewModel)
    }
}

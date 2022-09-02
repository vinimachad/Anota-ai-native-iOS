//
//  HomeController.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 02/09/22.
//

import Foundation

import Foundation
import UIKit

class HomeController<ViewModel: HomeProtocol>: UIViewController {
    
    // MARK: - Private properties
    
    private let contentView: HomeView
    private var viewModel: ViewModel
    
    // MARK: - Init
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        contentView = HomeView()
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

extension HomeController {
    
    private func bind() {
        contentView.bindIn(viewModel: viewModel)
    }
}

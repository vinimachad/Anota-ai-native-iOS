//
//  AlertControllerTests.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 12/08/22.
//

import Foundation
@testable import Anota_Ai
import XCTest

class AlertControllerTests: XCTestCase {
    
    var sut: AlertController<AlertViewModelMock>!
    var viewModelMock: AlertViewModelMock!
    
    override func setUp() {
        viewModelMock = AlertViewModelMock()
        sut = AlertController(viewModel: viewModelMock)
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UINavigationController(rootViewController: sut)
        window.makeKeyAndVisible()
        
        _ = sut.view
    }
    
    
}


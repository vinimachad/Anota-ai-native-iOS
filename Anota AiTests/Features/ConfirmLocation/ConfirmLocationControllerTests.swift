//
//  ConfirmLocationControllerTests.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 13/08/22.
//

import Foundation
import XCTest
@testable import Anota_Ai

class ConfirmLocationControllerTests: XCTestCase {
    
    var sut: ConfirmLocationController<ConfirmLocationViewModelMock>!
    var viewModelMock: ConfirmLocationViewModelMock!
    var delegateMock: ConfirmLocationControllerDelegateMock!
    
    override func setUp() {
        viewModelMock = ConfirmLocationViewModelMock()
        delegateMock = ConfirmLocationControllerDelegateMock()
        sut = ConfirmLocationController(viewModel: viewModelMock)
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UINavigationController(rootViewController: sut)
        window.makeKeyAndVisible()
        
        _ = sut.view
        
    }
}


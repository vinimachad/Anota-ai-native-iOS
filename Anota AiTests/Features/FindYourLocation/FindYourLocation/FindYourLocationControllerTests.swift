//
//  FindYourLocationControllerTests.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 06/08/22.
//

import Foundation
@testable import Anota_Ai
import XCTest

class FindYourLocationControllerTests: XCTestCase {
    
    var sut: FindYourLocationController<FindYourLocationViewModelMock>!
    var delegateMock: FindYourLocationControllerDelegateMock!
    var viewModelMock: FindYourLocationViewModelMock!
    
    override func setUp() {
        self.delegateMock = FindYourLocationControllerDelegateMock()
        self.viewModelMock = FindYourLocationViewModelMock()
        self.sut = FindYourLocationController(viewModel: viewModelMock, delegate: delegateMock)
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UINavigationController(rootViewController: sut)
        window.makeKeyAndVisible()
        
        _ = sut.view
    }
    
    func test_viewDidLoad_whenIsCalled_expectedHasLoadingView() {
        sut.viewDidLoad()
        
        let loadingView = sut.view.subviews.compactMap { $0 as? LoadingView }
        XCTAssertEqual(loadingView.count, 1)
    }
}

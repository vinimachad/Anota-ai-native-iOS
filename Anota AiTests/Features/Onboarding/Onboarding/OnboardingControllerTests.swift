//
//  OnboardingControllerTests.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 05/08/22.
//

import Foundation
import XCTest
@testable import Anota_Ai

class OnboardingControllerTests: XCTestCase {
    
    var sut: OnboardingController<OnboardingViewModelMock>!
    var viewModelMock: OnboardingViewModelMock!
    var delegateMock: OnboardingControllerDelegateMock!
    
    override func setUp() {
        viewModelMock = OnboardingViewModelMock()
        delegateMock = OnboardingControllerDelegateMock()
        sut = OnboardingController(viewModel: viewModelMock, delegate: delegateMock)
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UINavigationController(rootViewController: sut)
        window.makeKeyAndVisible()
        
        _ = sut.view
    }
    
    func test_viewDidLoad_whenIsCalled_expectedViewModelInvokeDidChangeCurrentExplanation() {
        sut.viewDidLoad()
        
        XCTAssertEqual(viewModelMock.invokedDidChangeCurrentExplanationCount, 2)
    }
    
    func test_bind_whenViewModelInvokeOnTapToCreateAccount_expectInvokePresentFindYourLocation() {
        viewModelMock.onTapToCreateAccount?()
        XCTAssertEqual(delegateMock.invokedPresentFindYourLocationCount, 1)
    }
    
}

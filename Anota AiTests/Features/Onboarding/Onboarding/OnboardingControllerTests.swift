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
    
    override func setUp() {
        viewModelMock = OnboardingViewModelMock()
        sut = OnboardingController(viewModel: viewModelMock)
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UINavigationController(rootViewController: sut)
        window.makeKeyAndVisible()
        
        _ = sut.view
    }
    
    func test_viewDidLoad_whenIsCalled_expectedViewModelInvokeDidChangeCurrentExplanation() {
        sut.viewDidLoad()
        
        XCTAssertEqual(viewModelMock.invokedDidChangeCurrentExplanationCount, 2)
    }
    
}

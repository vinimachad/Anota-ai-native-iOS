//
//  OnboardingViewModelTests.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 05/08/22.
//

import Foundation
import XCTest
@testable import Anota_Ai

class OnboardingViewModelTests: XCTestCase {
    
    var sut: OnboardingViewModel!
    
    override func setUp() {
        self.sut = OnboardingViewModel()
    }
    
    func test_didChangeCurrentExplanation_whenIsCalled_expectedInvokeOnExplanationWillDisplayAndIndexPathIsCorrect() {
        var invokedOnExplanationWillDisplay = (count: 0, indexPath: IndexPath())
        let expectedIndexPath = IndexPath(row: 0, section: 0)
        
        sut.onExplanationWillDisplay = { indexPath in
            invokedOnExplanationWillDisplay.count += 1
            invokedOnExplanationWillDisplay.indexPath = indexPath
        }
        
        sut.didChangeCurrentExplanation()
        
        XCTAssertEqual(invokedOnExplanationWillDisplay.count, 1)
        XCTAssertEqual(invokedOnExplanationWillDisplay.indexPath, expectedIndexPath)
    }
    
    func test_didChangeCurrentExplanation_whenCarouselCountIsGreaterThenTwo_expectedIndexPathRowIsZeroAndInvokedOnExplanationWillDisplay() {
        var invokedOnExplanationWillDisplay = (count: 0, indexPath: IndexPath())
        let expectedIndexPath = IndexPath(row: 0, section: 0)
        
        sut.onExplanationWillDisplay = { indexPath in
            invokedOnExplanationWillDisplay.count += 1
            invokedOnExplanationWillDisplay.indexPath = indexPath
        }
        
        sut.didChangeCurrentExplanation()
        sut.didChangeCurrentExplanation()
        sut.didChangeCurrentExplanation()
        sut.didChangeCurrentExplanation()
        
        XCTAssertEqual(invokedOnExplanationWillDisplay.count, 4)
        XCTAssertEqual(invokedOnExplanationWillDisplay.indexPath, expectedIndexPath)
    }
    
    func test_didTapToCreateAccount_whenCalled_expectInvokeOnTapToCreateAccount() {
        var invokedOnTapToCreateAccountCount = 0
        
        sut.onTapToCreateAccount = {
            invokedOnTapToCreateAccountCount += 1
        }
        
        sut.didTapToCreateAccount()
        XCTAssertEqual(invokedOnTapToCreateAccountCount, 1)
    }
}

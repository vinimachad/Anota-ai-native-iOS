//
//  OnboardingViewModelMock.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 05/08/22.
//

import Foundation
import CollectionDS_SDK
@testable import Anota_Ai

class OnboardingViewModelMock: OnboardingProtocol {
    
    var invokedDidChangeCurrentExplanationCount = 0
    var invokedDidTapToCreateAccountCount = 0
    
    var sections: [CollectionSectionProtocol] = []
    var onExplanationWillDisplay: ((IndexPath) -> Void)?
    var onTapToCreateAccount: (() -> Void)?
    
    func didChangeCurrentExplanation() {
        invokedDidChangeCurrentExplanationCount += 1
    }
    
    func didTapToCreateAccount() {
        invokedDidTapToCreateAccountCount += 1
    }
}

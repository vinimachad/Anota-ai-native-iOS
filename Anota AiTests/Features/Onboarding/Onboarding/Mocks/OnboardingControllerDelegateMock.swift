//
//  OnboardingControllerDelegateMock.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 06/08/22.
//

import Foundation
@testable import Anota_Ai

class OnboardingControllerDelegateMock: OnboardingControllerDelegate {
    
    var invokedPresentFindYourLocationCount = 0
    
    func presentFindYourLocation() {
        invokedPresentFindYourLocationCount += 1
    }
}

//
//  FindYourLocationControllerDelegateMock.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 06/08/22.
//

import Foundation
@testable import Anota_Ai

class FindYourLocationControllerDelegateMock: FindYourLocationControllerDelegate {
    
    var invokedReturnNavigationCount = 0
    
    func returnNavigation() {
        invokedReturnNavigationCount += 1
    }
}

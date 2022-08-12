//
//  AlertViewModelMock.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 12/08/22.
//

import Foundation
@testable import Anota_Ai

class AlertViewModelMock: AlertProtocol {
    var title: String = ""
    var description: String = ""
    var actions: [Button] = []
}

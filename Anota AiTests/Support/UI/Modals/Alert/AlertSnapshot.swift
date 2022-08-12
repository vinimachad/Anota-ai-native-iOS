//
//  AlertSnapshot.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 12/08/22.
//

import Foundation
@testable import Anota_Ai
import FBSnapshotTestCase

class AlertSnapshot: FBSnapshotTestCase {
    
    var sut: AlertView!
    var viewModelMock: AlertViewModelMock!
    
    override func setUp() {
        super.setUp()
        sut = AlertView()
        viewModelMock = AlertViewModelMock()
        sut.frame = CGRect(x: 0, y: 0, width: 328, height: 295)
    }
    
    func test_init_expectValidSnapshot() {
        FBSnapshotVerifyView(sut)
    }
    
    func test_bind_whenAllValuesIsFilled_expectValidSnapshot() {
        let action = Button(title: "Test button")
        viewModelMock.actions = [action]
        viewModelMock.title = "Test title"
        viewModelMock.description = "Test description"
        sut.bindIn(viewModel: viewModelMock)
        FBSnapshotVerifyView(sut)
    }
}

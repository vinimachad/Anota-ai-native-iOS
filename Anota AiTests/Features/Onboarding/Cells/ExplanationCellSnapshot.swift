//
//  ExplanationCellSnapshot.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 05/08/22.
//

import Foundation
@testable import Anota_Ai
import FBSnapshotTestCase

class ExplanationCellSnapshot: FBSnapshotTestCase {
    
    var sut: ExplanationCell!
    var viewModelMock: ExplanationCellViewModelMock!
    
    override func setUp() {
        super.setUp()
        sut = ExplanationCell()
        viewModelMock = ExplanationCellViewModelMock()
        sut.frame = CGRect(x: 0, y: 0, width: 414, height: 498)
        sut.backgroundColor = .Shapes.shape
    }
    
    func test_init_expectValidSnapshot() {
        FBSnapshotVerifyView(sut)
    }
    
    func test_bind_whenAllValuesIsFilled_expectValidSnapshot() {
        viewModelMock.cover = .Images.mobileCalculator
        viewModelMock.title = "Title test"
        viewModelMock.body = "Body test"
        sut.bindIn(viewModel: viewModelMock)
        FBSnapshotVerifyView(sut)
    }
}

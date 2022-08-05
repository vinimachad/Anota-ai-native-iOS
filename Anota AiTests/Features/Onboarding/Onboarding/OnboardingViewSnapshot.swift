//
//  OnboardingViewSnapshot.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 05/08/22.
//

import Foundation
import FBSnapshotTestCase
import CollectionDS_SDK
@testable import Anota_Ai

class OnboardingViewSnapshot: FBSnapshotTestCase {
    
    var sut: OnboardingView!
    var viewModelMock: OnboardingViewModelMock!
    
    override func setUp() {
        super.setUp()
        sut = OnboardingView()
        viewModelMock = OnboardingViewModelMock()
        sut.frame = CGRect(x: 0, y: 0, width: 414, height: 800)
    }
    
    func test_init_expectValidSnapshot() {
        FBSnapshotVerifyView(sut)
    }
    
    func test_bind_whenAllValuesIsFilled_expectValidSnapshot() {
        let viewModels = Explanations.allCases.map { ExplanationCellViewModel(title: $0.title, body: $0.body, cover: $0.cover) }
        let section = CollectionSection<ExplanationCell>(items: viewModels, lineGap: 0)
        viewModelMock.sections = [section]
        sut.bindIn(viewModel: viewModelMock)
        FBSnapshotVerifyView(sut)
    }
    
    func test_bind_whenChangeCurrentExplanationToThirdExplanationCarousel_expectValidSnapshot() {
        let viewModels = Explanations.allCases.map { ExplanationCellViewModel(title: $0.title, body: $0.body, cover: $0.cover) }
        let section = CollectionSection<ExplanationCell>(items: viewModels, lineGap: 0)
        viewModelMock.sections = [section]
        sut.bindIn(viewModel: viewModelMock)
        viewModelMock.onExplanationWillDisplay!(IndexPath(row: 2, section: 0))
        FBSnapshotVerifyView(sut)
    }
}

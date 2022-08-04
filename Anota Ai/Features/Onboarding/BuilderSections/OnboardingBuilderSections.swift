//
//  OnboardingBuilderSections.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 04/08/22.
//

import Foundation
import CollectionDS_SDK

class OnboardingBuilderSections {
    
    // MARK: - Private properties
    
    // MARK: - Init
    
    // MARK: - Sections
    
    private func explanationSection() -> CollectionSectionProtocol {
        CollectionSection<ExplanationCell>(
            items: [
                ExplanationCellViewModel(name: "1"), ExplanationCellViewModel(name: "2"),
                ExplanationCellViewModel(name: "3"), ExplanationCellViewModel(name: "4")
            ], lineGap: 0
        )
    }
    
    // MARK: - Builder
    
    func builder() -> [CollectionSectionProtocol] {
        [explanationSection()]
    }
}

//
//  OnboardingBuilderSections.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 04/08/22.
//

import Foundation
import CollectionDS_SDK

class OnboardingBuilderSections: BuilderSectionProtocol {
    
    // MARK: - Init
    
    // MARK: - Sections
    
    private func explanationSection() -> CollectionSectionProtocol {
        let viewModels = Explanations.allCases.map {
            ExplanationCellViewModel(title: $0.title, body: $0.body, cover: $0.cover)
        }
        return CollectionSection<ExplanationCell>(items: viewModels, lineGap: 0)
    }
    
    // MARK: - Builder
    
    func builder() -> [CollectionSectionProtocol] {
        [explanationSection()]
    }
}

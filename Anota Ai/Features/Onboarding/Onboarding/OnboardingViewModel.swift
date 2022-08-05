//
//  OnboardingViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/08/22.
//

import Foundation
import CollectionDS_SDK


protocol OnboardingProtocol: OnboardingViewModelProtocol {
    func didChangeCurrentExplanation(_ index: IndexPath)
}

class OnboardingViewModel {
    
    // MARK: - Public properties
    
    var onExplanationWillDisplay: ((IndexPath) -> Void)?
    
    lazy var sections: [CollectionSectionProtocol] = {
        onboardingBuilderSections.builder()
    }()
    
    // MARK: - Private properties
    
    private lazy var onboardingBuilderSections = OnboardingBuilderSections()
    private var carouselCount = 0
    
    // MARK: - Init
    
    // MARK: - Action
    
    func didChangeCurrentExplanation(_ index: IndexPath) {
                
        if self.carouselCount > 2 {
            self.carouselCount = 0
        }
        
        let index = IndexPath(row: self.carouselCount, section: index.section)
        self.onExplanationWillDisplay?(index)
        self.carouselCount += 1
    }
}

// MARK: - OnboardingProtocol

extension OnboardingViewModel: OnboardingProtocol {
    
}

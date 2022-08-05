//
//  OnboardingViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/08/22.
//

import Foundation
import CollectionDS_SDK


protocol OnboardingProtocol: OnboardingViewModelProtocol {
    func didChangeCurrentExplanation()
}

class OnboardingViewModel {
    
    // MARK: - Public properties
    
    var onExplanationWillDisplay: ((IndexPath) -> Void)?
    
    lazy var sections: [CollectionSectionProtocol] = {
        onboardingBuilderSections.builder()
    }()
    
    // MARK: - Private properties
    
    private lazy var onboardingBuilderSections = OnboardingBuilderSections()
    private(set) var carouselCount = 0
    
    // MARK: - Init
}

// MARK: - OnboardingProtocol

extension OnboardingViewModel: OnboardingProtocol {
    
    // MARK: - Action
    
    func didChangeCurrentExplanation() {
        
        if self.carouselCount > 2 {
            self.carouselCount = 0
        }
        
        let index = IndexPath(row: self.carouselCount, section: 0)
        print(index)
        self.onExplanationWillDisplay?(index)
        self.carouselCount += 1
    }
}

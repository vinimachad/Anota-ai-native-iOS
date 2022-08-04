//
//  OnboardingViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/08/22.
//

import Foundation
import CollectionDS_SDK


protocol OnboardingProtocol: OnboardingViewModelProtocol {
    
}

class OnboardingViewModel {
    
    // MARK: - Public properties
    
    lazy var sections: [CollectionSectionProtocol] = {
        onboardingBuilderSections.builder()
    }()
    
    // MARK: - Private properties
    
    private var onboardingBuilderSections = OnboardingBuilderSections()
    
    // MARK: - Init
    
    init() {
        
    }
}

// MARK: - OnboardingProtocol

extension OnboardingViewModel: OnboardingProtocol {
    
}

//
//  OnboardingViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/08/22.
//

import Foundation
import CollectionDS_SDK


protocol OnboardingProtocol: OnboardingViewModelProtocol {
    func explanationWillDisplay(_ index: IndexPath)
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
    
    init() {
        
    }
    
    // MARK: - Action
    
    func explanationWillDisplay(_ index: IndexPath) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) { [weak self] in

            self?.carouselCount += 1
            if self?.carouselCount ?? 0 >= 3 {
                self?.carouselCount = 0
            }
            
            let index = IndexPath(row: self?.carouselCount ?? 0, section: index.section)
            self?.onExplanationWillDisplay?(index)
        }
    }
}

// MARK: - OnboardingProtocol

extension OnboardingViewModel: OnboardingProtocol {
    
}

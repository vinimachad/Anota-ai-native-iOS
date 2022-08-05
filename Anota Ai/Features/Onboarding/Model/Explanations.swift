//
//  Explanations.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 04/08/22.
//

import Foundation
import UIKit

enum Explanations: CaseIterable {
    
    case control
    case calculating
    case test
    
    var title: String? {
        switch self {
        case .control: return "control_title_label".localize(.onboarding)
        case .calculating: return "calculating_title_label".localize(.onboarding)
        case .test: return "test_title_label".localize(.onboarding)
        }
    }
    
    var body: String? {
        switch self {
        case .control: return "control_body_label".localize(.onboarding)
        case .calculating: return "calculating_body_label".localize(.onboarding)
        case .test: return "test_body_label".localize(.onboarding)
        }
    }
    
    var cover: UIImage? {
        switch self {
        case .control: return UIImage.Images.mobilePosts
        case .calculating: return UIImage.Images.mobileCalculator
        case .test: return UIImage.Images.mobileLogin
        }
    }
}

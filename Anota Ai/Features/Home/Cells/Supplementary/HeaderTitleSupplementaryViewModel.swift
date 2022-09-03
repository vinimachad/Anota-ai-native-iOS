//
//  HeaderTitleSupplementaryViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/09/22.
//

import Foundation
import CollectionDS_SDK

struct HeaderTitleSupplementaryViewModel: HeaderTitleSupplementaryViewModelProtocol {
    
    var title: String = "teste"
    
    var cellType: UICollectionReusableView.Type {
        HeaderTitleSupplementary.self
    }
    
    func size(width: CGFloat) -> CGSize {
        CGSize(width: width, height: 70)
    }
}

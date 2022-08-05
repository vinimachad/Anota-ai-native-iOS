//
//  ExplanationCellViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/08/22.
//

import Foundation
import UIKit

class ExplanationCellViewModel: ExplanationCellViewModelProtocol {
    
    var title: String?
    var body: String?
    var cover: UIImage?
    
    init(title: String?, body: String?, cover: UIImage?) {
        self.title = title
        self.body = body
        self.cover = cover
    }
}

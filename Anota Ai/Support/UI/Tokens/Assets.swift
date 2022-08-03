//
//  Images.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/08/22.
//

import Foundation
import UIKit

extension UIImage {
    
    enum Images {
        
        static var mobilePosts: UIImage {
            UIImage(named: "img_mobile_posts") ?? UIImage()
        }
        
        static var mobileCalculator: UIImage {
            UIImage(named: "img_mobile_calculator") ?? UIImage()
        }
        
        static var mobileLogin: UIImage {
            UIImage(named: "img_mobile_login") ?? UIImage()
        }
    }
}

//
//  Images.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/08/22.
//

import Foundation
import UIKit
import SwiftUI

extension String {
    
    enum Images {
        
        static var back: String {
            "chevron.backward"
        }
    }
}

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
    
    enum Icons {
        
        static var back: UIImage {
            UIImage(systemName: "chevron.backward") ?? UIImage()
        }
        
        static var eye: UIImage {
            UIImage(systemName: "eye.fill") ?? UIImage()
        }
        
        static var eyeSlash: UIImage {
            UIImage(systemName: "eye.slash") ?? UIImage()
        }
    }
}

//
//  Colors.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/08/22.
//

import Foundation
import UIKit

extension UIColor {

    enum Brand {
        
        static var primary: UIColor {
            UIColor(named: "primary") ?? UIColor()
        }
        
        static var secondary: UIColor {
            UIColor(named: "secondary") ?? UIColor()
        }
    }
    
    enum Shapes {
        
        static var box: UIColor {
            UIColor(named: "box") ?? UIColor()
        }
        
        static var shape: UIColor {
            UIColor(named: "shape") ?? UIColor()
        }
        
        static var stroke: UIColor {
            UIColor(named: "stroke") ?? UIColor()
        }
    }
    
    enum Texts {
        
        static var body: UIColor {
            UIColor(named: "body") ?? UIColor()
        }
        
        static var heading: UIColor {
            UIColor(named: "headings") ?? UIColor()
        }
        
        static var input: UIColor {
            UIColor(named: "inputs") ?? UIColor()
        }
    }
}

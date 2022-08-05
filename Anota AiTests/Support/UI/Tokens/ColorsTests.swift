//
//  ColorsTests.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 04/08/22.
//

import Foundation
import XCTest
@testable import Anota_Ai

class ColorsTests: XCTestCase {
    
    func test_primary_expectedColorIsEqualToPrimary() {
        let expected = UIColor(named: "primary")
        XCTAssertEqual(UIColor.Brand.primary, expected)
    }
    
    func test_secondary_expectedColorIsEqualToSecondary() {
        let expected = UIColor(named: "secondary")
        XCTAssertEqual(UIColor.Brand.secondary, expected)
    }
    
    func test_box_expectedColorIsEqualToBox() {
        let expected = UIColor(named: "box")
        XCTAssertEqual(UIColor.Shapes.box, expected)
    }
    
    func test_shape_expectedColorIsEqualToShape() {
        let expected = UIColor(named: "shape")
        XCTAssertEqual(UIColor.Shapes.shape, expected)
    }
    
    func test_stroke_expectedColorIsEqualToStroke() {
        let expected = UIColor(named: "stroke")
        XCTAssertEqual(UIColor.Shapes.stroke, expected)
    }
    
    func test_body_expectedColorIsEqualToBody() {
        let expected = UIColor(named: "body")
        XCTAssertEqual(UIColor.Texts.body, expected)
    }
    
    func test_heading_expectedColorIsEqualToHeading() {
        let expected = UIColor(named: "headings")
        XCTAssertEqual(UIColor.Texts.heading, expected)
    }
    
    func test_input_expectedColorIsEqualToInput() {
        let expected = UIColor(named: "inputs")
        XCTAssertEqual(UIColor.Texts.input, expected)
    }
}

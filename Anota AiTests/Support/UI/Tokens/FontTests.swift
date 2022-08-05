//
//  FontTests.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 04/08/22.
//

import Foundation
import XCTest
@testable import Anota_Ai

class FontTests: XCTestCase {
    
    func test_regular_expectedFontIsEqualToRegular () {
        let expected = UIFont(name: UIFont.FontType.regular.rawValue, size: 12)
        XCTAssertEqual(UIFont.default(type: .regular, ofSize: 12), expected)
    }
    
    func test_bold_expectedFontIsEqualToBold () {
        let expected = UIFont(name: UIFont.FontType.bold.rawValue, size: 12)
        XCTAssertEqual(UIFont.default(type: .bold, ofSize: 12), expected)
    }

    func test_medium_expectedFontIsEqualToMedium () {
        let expected = UIFont(name: UIFont.FontType.medium.rawValue, size: 12)
        XCTAssertEqual(UIFont.default(type: .medium, ofSize: 12), expected)
    }
}

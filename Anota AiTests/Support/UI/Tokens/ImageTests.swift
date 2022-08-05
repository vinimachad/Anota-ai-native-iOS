//
//  ImageTests.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 04/08/22.
//

import Foundation
import XCTest
@testable import Anota_Ai

class ImageTests: XCTestCase {
    
    func test_mobilePosts_expectedImageIsImgMobilePosts() {
        let expected = UIImage(named: "img_mobile_posts")
        XCTAssertEqual(UIImage.Images.mobilePosts, expected)
    }
    
    func test_mobileCalculator_expectedImageIsImgMobileCalculator() {
        let expected = UIImage(named: "img_mobile_calculator")
        XCTAssertEqual(UIImage.Images.mobileCalculator, expected)
    }
    
    func test_mobileLogin_expectedImageIsImgMobileLogin() {
        let expected = UIImage(named: "img_mobile_login")
        XCTAssertEqual(UIImage.Images.mobileLogin, expected)
    }
}

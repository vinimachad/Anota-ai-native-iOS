//
//  TextFieldSnapshot.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 13/08/22.
//

import Foundation
@testable import Anota_Ai
import FBSnapshotTestCase

class TextFieldSnapshot: FBSnapshotTestCase {
    
    var sut: TextFieldComponent!
    var containerView: UIView!
    
    override func setUp() {
        super.setUp()
        sut = TextFieldComponent()
        containerView = UIView()
        sut.frame = CGRect(x: 16, y: 16, width: 382, height: 48)
        containerView.frame = CGRect(x: 0, y: 0, width: 414, height: 80)
        containerView.backgroundColor = .Shapes.shape
        containerView.addSubview(sut)
    }
    
    func test_init_expectValidSnapshot() {
        FBSnapshotVerifyView(containerView)
    }
    
    func test_setTitle_whenAllValuesIsFilled_expectValidSnapshot() {
        sut.setTitle("Title")
        FBSnapshotVerifyView(containerView)
    }
    
    func test_setTitle_whenTextIsFilled_expectedValidSnapshot() {
        sut.setTitle("Title")
        sut.text = "Test"
        FBSnapshotVerifyView(containerView)
    }
}

//
//  ButtonSnapshot.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 05/08/22.
//

import Foundation
@testable import Anota_Ai
import FBSnapshotTestCase

class ButtonSnapshot: FBSnapshotTestCase {
    
    var sut: Button!
    var containerView: UIView!
    
    override func setUp() {
        super.setUp()
        sut = Button()
        containerView = UIView()
        sut.frame = CGRect(x: 16, y: 16, width: 382, height: 48)
        containerView.frame = CGRect(x: 0, y: 0, width: 414, height: 80)
        containerView.backgroundColor = .Shapes.shape
        containerView.addSubview(sut)
    }
    
    func test_init_expectValidSnapshot() {
        FBSnapshotVerifyView(containerView)
    }
    
    func test_setup_whenAllValuesIsFilled_expectValidSnapshot() {
        sut.title = "Criar conta"
        sut.backgroundColor = .Brand.primary
        sut.titleColor = .Shapes.shape
        FBSnapshotVerifyView(containerView)
    }
}

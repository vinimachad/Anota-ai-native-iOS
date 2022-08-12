//
//  LoadingSnapshot.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 12/08/22.
//

import Foundation
@testable import Anota_Ai
import FBSnapshotTestCase

class LoadingSnapshot: FBSnapshotTestCase {
    
    var sut: LoadingView!
    
    override func setUp() {
        super.setUp()
        sut = LoadingView()
        sut.frame = CGRect(x: 0, y: 0, width: 414, height: 400)
    }
    
    func test_init_expectValidSnapshot() {
        FBSnapshotVerifyView(sut)
    }
    
    func test_startAnimatingActivityIndicator_expectValidSnapshot() {
        sut.startAnimatingActivityIndicator()
        FBSnapshotVerifyView(sut)
    }
    
    func test_stopAnimatingActivityIndicator_expectValidSnapshot() {
        sut.stopAnimatingActivityIndicator()
        FBSnapshotVerifyView(sut)
    }
}

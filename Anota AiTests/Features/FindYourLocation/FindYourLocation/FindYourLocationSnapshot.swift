//
//  FindYourLocationSnapshot.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 06/08/22.
//

import Foundation
@testable import Anota_Ai
import FBSnapshotTestCase
import CoreLocation

class FindYourLocationSnapshot: FBSnapshotTestCase {
    
    var sut: FindYourLocationView!
    var viewModelMock: FindYourLocationViewModelMock!
    
    override func setUp() {
        super.setUp()
        sut = FindYourLocationView()
        viewModelMock = FindYourLocationViewModelMock()
        sut.frame = CGRect(x: 0, y: 0, width: 414, height: 800)
        sut.backgroundColor = .Shapes.shape
    }
    
    func test_init_expectValidSnapshot() {
        FBSnapshotVerifyView(sut)
    }
    
    func test_bind_whenAllValuesIsFilled_expectValidSnapshot() {
        let coordinator = CLLocationCoordinate2D(latitude: CLLocationDegrees(-20.4353613), longitude: CLLocationDegrees(-54.6204637))
        sut.bindIn(viewModel: viewModelMock)
        viewModelMock.onUpdateUserCurrentLocation?(coordinator)
        FBSnapshotVerifyView(sut)
    }
}

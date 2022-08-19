//
//  ConfirmLocationSnapshot.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 13/08/22.
//

import Foundation
@testable import Anota_Ai
import FBSnapshotTestCase
import MapKit

class ConfirmLocationSnapshot: FBSnapshotTestCase {
    
    var sut: ConfirmLocationView!
    var viewModelMock: ConfirmLocationViewModelMock!
    
    override func setUp() {
        super.setUp()
        sut = ConfirmLocationView()
        viewModelMock = ConfirmLocationViewModelMock()
        sut.frame = CGRect(x: 0, y: 0, width: 414, height: 800)
    }
    
    func test_init_expectValidSnapshot() {
        FBSnapshotVerifyView(sut)
    }
    
    func test_bind_whenAllValuesIsFilled_expectValidSnapshot() {
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
            latitudinalMeters: 100,
            longitudinalMeters: 100
        )
        viewModelMock.region = region
        viewModelMock.streetDetails = "R. Araras, 187, São Francisco"
        viewModelMock.city = "Campo Grande - MS, 79118-040"
        sut.bindIn(viewModel: viewModelMock)
        FBSnapshotVerifyView(sut)
    }
}

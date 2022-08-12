//
//  FindYourLocationControllerTests.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 06/08/22.
//

import Foundation
@testable import Anota_Ai
import XCTest
import CoreLocation

class FindYourLocationControllerTests: XCTestCase {
    
    var sut: FindYourLocationController<FindYourLocationViewModelMock>!
    var delegateMock: FindYourLocationControllerDelegateMock!
    var viewModelMock: FindYourLocationViewModelMock!
    
    override func setUp() {
        self.delegateMock = FindYourLocationControllerDelegateMock()
        self.viewModelMock = FindYourLocationViewModelMock()
        self.sut = FindYourLocationController(viewModel: viewModelMock, delegate: delegateMock)
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UINavigationController(rootViewController: sut)
        window.makeKeyAndVisible()
        
        _ = sut.view
    }
    
    func test_bind_whenViewModelCallOnFailureGetAuthorization_expectedPresentAlertModal() {
        sut.viewDidLoad()
        viewModelMock.onFailureGetAuthorization?()
        XCTAssertTrue(sut.navigationController?.presentedViewController is AlertController<AlertViewModel>)
    }
    
    func test_bind_whenViewModelCallOnSuccessGetLocalization_expectedInvokedPushConfirmLocalization() {
        sut.viewDidLoad()
        viewModelMock.onSuccessGetLocalization?(CLLocationCoordinate2D(latitude: 0, longitude: 0))
        XCTAssertEqual(delegateMock.invokedPushConfirmLocalizationCount, 1)
    }
}

//
//  ConfirmLocationViewModelMock.swift
//  Anota AiTests
//
//  Created by Vinicius Galhardo Machado on 13/08/22.
//

import Foundation
@testable import Anota_Ai
import MapKit

class ConfirmLocationViewModelMock: ConfirmLocationProtocol {
    
    var invokedDidChangeNumber = (count: 0, text: "")
    var invokedDidChangeComplement = (count: 0, text: "")
    var invokedDidSaveAddressCount = 0
    var invokedValidateFieldsCont = 0
    
    var region: MKCoordinateRegion = MKCoordinateRegion()
    var streetDetails: String = ""
    var city: String = ""
    var onButtonStateIsEnable: ((Bool) -> Void)?
    
    func didChangeNumber(text: String?) {
        invokedDidChangeNumber.count += 1
        invokedDidChangeNumber.text = text ?? ""
    }
    
    func didChangeComplement(text: String?) {
        invokedDidChangeComplement.count += 1
        invokedDidChangeComplement.text = text ?? ""
    }
    
    func didSaveAddress() {
        invokedDidSaveAddressCount += 1
    }
    
    func validateFields() {
        invokedValidateFieldsCont += 1
    }
}

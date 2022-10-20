//
//  ViewFactoryProtocol.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 30/09/22.
//

import SwiftUI

protocol ViewFactoryProtocol {
    associatedtype CreatedView: View
    
    static func createView() -> CreatedView
}

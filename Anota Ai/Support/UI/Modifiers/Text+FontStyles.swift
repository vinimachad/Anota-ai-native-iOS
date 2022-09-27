//
//  Text+FontStyles.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 27/09/22.
//

import Foundation
import SwiftUI

extension Text {
    
    func headingFont(size: CGFloat) -> some View {
        self
            .font(.default(type: .bold, ofSize: size))
            .foregroundColor(.Texts.heading)
    }
    
    func bodyFont(size: CGFloat) -> some View {
        self
            .font(.default(type: .regular, ofSize: size))
            .foregroundColor(.Texts.body)
    }
}

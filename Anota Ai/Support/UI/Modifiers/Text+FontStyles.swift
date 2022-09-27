//
//  Text+FontStyles.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 27/09/22.
//

import Foundation
import SwiftUI

extension Text {
    
    func headerTitle() -> some View {
        self
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.Texts.heading)
    }
    
    func subHeaderFont(color: Color = .Texts.heading, weight: Font.Weight = .bold) -> some View {
        self
            .font(.title2)
            .fontWeight(weight)
            .foregroundColor(color)
    }
    
    func thirdHeaderFont() -> some View {
        self
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.Texts.heading)
    }
    
    func bodyFont(color: Color = .Texts.body, weight: Font.Weight = .regular) -> some View {
        self
            .font(.body)
            .fontWeight(weight)
            .foregroundColor(color)
    }
}

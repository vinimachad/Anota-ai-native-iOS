//
//  RectangleButton.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 13/09/22.
//

import SwiftUI

struct RectangleButton: ButtonStyle {    
    
    var backgroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.Texts.heading)
            .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(backgroundColor)
                    .shadow(color: .Shapes.stroke, radius: 4, x: 4, y: 2)
            )
    }
}

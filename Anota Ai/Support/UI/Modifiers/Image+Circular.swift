//
//  Image+Circular.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 24/09/22.
//

import SwiftUI

extension Image {
    
    func circleImage(width: CGFloat, height: CGFloat, alignment: Alignment = .center) -> some View {
        self
            .resizable()
            .clipShape(Circle())
            .frame(width: width, height: height, alignment: alignment)
            .scaledToFill()
    }
}

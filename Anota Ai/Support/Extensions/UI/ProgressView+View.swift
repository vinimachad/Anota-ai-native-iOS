//
//  ProgressView+View.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 22/09/22.
//

import SwiftUI

extension View {
    
    func loadingView() -> some View {
        HStack(alignment: .center) {
            Spacer()
            ProgressView()
                .progressViewStyle(.circular)
            Spacer()
        }
        .background(Color.Shapes.shape)
        .edgesIgnoringSafeArea(.all)
        .frame(height: 0)
    }
}

//
//  FilterView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 25/09/22.
//

import SwiftUI

struct FilterView: View {
    
    var title: String
    
    var body: some View {
        Button(action: {
            
        }) {
            Text(title)
                .padding(.horizontal)
                .foregroundColor(.Texts.body)
        }
        .background(
            Capsule()
                .stroke(lineWidth: 1)
                .foregroundColor(.Shapes.stroke)
                .frame(height: 30)
        )
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(title: "Preço")
    }
}

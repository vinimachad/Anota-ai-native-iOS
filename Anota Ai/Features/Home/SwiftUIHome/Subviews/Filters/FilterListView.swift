//
//  FilterListView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 25/09/22.
//

import SwiftUI

struct FilterListView: View {
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                FilterView(title: "Preço")
                FilterView(title: "Distancia")
                FilterView(title: "Avaliação")
                FilterView(title: "Filtros")
            }.padding(.vertical)
        }
    }
}

struct FilterListView_Previews: PreviewProvider {
    static var previews: some View {
        FilterListView()
    }
}

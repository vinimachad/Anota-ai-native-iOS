//
//  FilterView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 25/09/22.
//

import SwiftUI

struct FilterView: View {
    
    // MARK: - Public properties
    
    var kind: KindFilter
    
    // MARK: - Private properties
    
    @EnvironmentObject private var viewModel: SwiftUIHomeViewModel
    @State private var isSelected: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        Button(action: {
            isSelected.toggle()
            
            if let index = viewModel.filterIsInUse.firstIndex(of: kind) {
                viewModel.filterIsInUse.remove(at: index)
                return
            }
            
            viewModel.filterIsInUse.append(kind)
        }) {
            Text(kind.title)
                .padding(.horizontal)
                .font(.default(type: .regular))
                .foregroundColor(isSelected ? .Brand.secondary : .Texts.body)
        }
        .background(
            Capsule()
                .stroke(lineWidth: 1)
                .foregroundColor(isSelected ? .Brand.secondary : .Shapes.stroke)
                .frame(height: 30)
        )
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(kind: .price)
    }
}

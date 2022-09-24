//
//  RestaurantKindSlide.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 05/09/22.
//

import SwiftUI

struct RestaurantKindSlide: View {
    
    var state: RequestState<[RestaurantKind]>
    @State private var opacity: Double = 0.2
    
    var body: some View {
        
        switch state {
        case .loading: generateLoadingEffect()
        case .success(let kinds): listOf(kinds: kinds)
        default: EmptyView()
        }
    }
}

extension RestaurantKindSlide {
    
    private func listOf(kinds: [RestaurantKind]) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Tipos de restaurantes").font(.default(type: .bold, ofSize: 16)).foregroundColor(.Texts.heading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [GridItem()], spacing: 16) {
                    ForEach(kinds) { kind in
                        Button(action: {
                            print(kind.id)
                        }) {
                            Text(kind.type)
                        }.buttonStyle(RectangleButton(backgroundColor: .Shapes.box))
                    }
            .padding([.vertical], 10)
                }
            }
        }
    }
    
    private func generateLoadingEffect() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            RoundedRectangle(cornerRadius: 4)
                .frame(width: 160, height: 15)
                .foregroundColor(.Shapes.stroke)
            HStack(spacing: 16) {
                ForEach(0..<3) { _ in
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(.Shapes.stroke)
                        .frame(width: 150, height: 48)
                }
            }
        }.shimmerEffect(opacity: opacity)
    }
}

struct RestaurantKindSlide_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantKindSlide(state: .loading)
    }
}

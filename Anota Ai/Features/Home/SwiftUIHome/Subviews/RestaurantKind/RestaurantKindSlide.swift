//
//  RestaurantKindSlide.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 05/09/22.
//

import SwiftUI

struct RestaurantKindSlide: View {
    
    var kinds: [RestaurantKind]
    
    var body: some View {
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
}

struct RestaurantKindSlide_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantKindSlide(kinds: [RestaurantKind(id: "asdasd", type: "Hamburgueria")])
    }
}

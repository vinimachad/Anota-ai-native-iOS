//
//  SegmentedControlView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 19/10/22.
//

import SwiftUI

struct SegmentedControlView: View {
    
    @Binding var items: [String]
    @Binding var selectedItem: String
    
    var body: some View {
        ZStack {
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: [GridItem()], alignment: .bottom, spacing: 0) {
                        ForEach(items, id: \.self) { item in
                            Button(action: {
                                proxy.scrollTo(item)
                                selectedItem = item
                            }) {
                                Text(item.capitalized)
                                    .foregroundColor(selectedItem == item ? .Brand.primary : Color(uiColor: .systemGray))
                                    .bodyFont(weight: .medium)
                            }
                            .id(item)
                            .padding(EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20))
                            .background(
                                selectedItem == item ? segmentedLine(color: .Brand.primary, height: 2) : segmentedLine(color: Color(uiColor: .clear)),
                                alignment: .bottomLeading
                           )
                        }
                    }
                }.background(
                    segmentedLine(color: Color(uiColor: .systemGray3)),
                    alignment: .bottomLeading
                )
            }
            .padding(.horizontal, -16)
            .frame(height: 60)
        }
    }
    
    private func segmentedLine(color: Color, height: CGFloat = 1) -> some View {
        Rectangle()
            .fill(color)
            .frame(height: height)
    }
}

struct SegmentedControlView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlView(items: .constant(["Todos", "Pizzas", "Bebidas"]), selectedItem: .constant("Todos"))
    }
}

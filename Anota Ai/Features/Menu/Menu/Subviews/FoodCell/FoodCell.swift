//
//  FoodCell.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 19/10/22.
//

import SwiftUI

struct FoodCell: View {
    
    var food: Food
    
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            VStack(alignment: .leading) {
                Text(food.name)
                    .bodyFont(color: .Texts.heading, weight: .medium)
                    .lineLimit(2)
                Text(food.description)
                    .bodyFont()
                    .lineLimit(3)
                Text("R$ \(food.price)")
                    .bodyFont(color: .Texts.heading, weight: .medium)
                    .padding(.top, 1)
            }
            Spacer()
            AsyncImage(url: URL(string: food.previewUrl)) { result in
                resultOfImageState(result)
            }
        }
        Divider()
    }
    
    private func resultOfImageState(_ result: AsyncImagePhase) -> some View {
        switch result {
        case .success(let image): return image
                .resizable()
                .scaledToFit()
                .cornerRadius(4)
                .frame(maxWidth: 100, maxHeight: 100)
        default:
            return Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .cornerRadius(4)
                .frame(maxWidth: 100)
        }
    }
}

struct FoodCell_Previews: PreviewProvider {
    static var previews: some View {
        FoodCell(food: Food.sample)
    }
}

//
//  NearRestaurantCard.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 22/09/22.
//

import SwiftUI

struct NearRestaurantCard: View {
    
    // MARK: - Properties
    
    var restaurant: Restaurant
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: restaurant.avatarUrl)) { result in
                resultOfImageState(result)
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text(restaurant.name)
                    .foregroundColor(.Texts.heading)
                    .font(.default(type: .regular, ofSize: 16))
                    .padding(.bottom, 13)
                    .lineLimit(2)
                
                Text(restaurant.type)
                    .foregroundColor(.Texts.body)
                    .font(.default(type: .regular, ofSize: 12))
                    .padding(.bottom, 4)
                    .lineLimit(2)
                
                HStack() {
                    HStack(spacing: 3) {
                        ForEach(0..<restaurant.evaluationToInt(), id: \.self) { _ in
                            starsEvaluation("star.fill").foregroundColor(.Others.yellow)
                        }
                        ForEach(0..<5-restaurant.evaluationToInt(), id: \.self) { _ in
                            starsEvaluation("star").foregroundColor(.gray)
                        }
                    }
                }
                
            }.padding(8)
        }
    }
    
    private func resultOfImageState(_ result: AsyncImagePhase) -> some View {
        switch result {
        case .success(let image):
            return NearPreviewImage(image: image)
        case .failure:
            return NearPreviewImage(image: Image(systemName: "photo"))
        case .empty:
            return NearPreviewImage(image: Image(systemName: "photo"))
        @unknown default:
            fatalError("teste")
        }
    }
    
    private func starsEvaluation(_ image: String) -> some View {
        Image(systemName: image)
            .resizable()
            .frame(width: 10, height: 10, alignment: .center)
    }
}

struct NearRestaurantCard_Previews: PreviewProvider {
    static var previews: some View {
        NearRestaurantCard(restaurant: Restaurant.sampleData[0])
    }
}

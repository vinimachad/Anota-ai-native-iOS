//
//  NearRestaurants.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 15/09/22.
//

import SwiftUI

struct NearRestaurants: View {
    
    var restaurants: [Restaurant]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Restaurantes proxímos de você")
                .font(.default(type: .bold, ofSize: 16))
                .foregroundColor(.Texts.heading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [GridItem(.flexible())], spacing: 16) {
                    ForEach(restaurants) { restaurant in
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
                                    Text("1,2")
                                        .foregroundColor(.Texts.body)
                                        .font(.default(type: .regular, ofSize: 12))
                                    HStack(spacing: 3) {
                                        ForEach(0..<restaurant.price, id: \.self) { _ in
                                            starsEvaluation("star.fill")
                                        }
                                        ForEach(0..<5-restaurant.price, id: \.self) { _ in
                                            starsEvaluation("star")
                                        }
                                    }
                                }
                                
                            }.padding(8)
                        }
                    }
                    .frame(width: 150)
                    .background(Color.Shapes.box)
                    .cornerRadius(8)
                    .shadow(color: .Shapes.stroke, radius: 4, x: 4, y: 2)
                }.padding(.vertical, 10)
            }
        }
    }
}

extension NearRestaurants {
    
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
            .foregroundColor(.Others.yellow)
    }
}

struct NearRestaurants_Previews: PreviewProvider {
    static var previews: some View {
        NearRestaurants(restaurants: Restaurant.sampleData)
    }
}

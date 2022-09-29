//
//  RestaurantDetailHeaderView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 27/09/22.
//

import SwiftUI

struct RestaurantDetailHeaderView: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            
            HStack(alignment: .center) {
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(restaurant.name)
                        .headerTitle()
                        .frame(maxWidth: 350, alignment: .leading)
                        .lineLimit(2)
                    Text(restaurant.type)
                        .bodyFont()
                }
                
                Spacer()
                asyncImageResult()
            }
            
            Text(restaurant.description)
                .bodyFont()
        }
    }
    
    private func asyncImageResult() -> some View {
        AsyncImage(url: URL(string: restaurant.avatarUrl)) { result in
            switch result {
            case .success(let image):
                image.circleImage(width: 50, height: 50)
            default:
                Image(systemName: "photo.circle.fill")
                    .circleImage(width: 50, height: 50)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct RestaurantDetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailHeaderView(restaurant: Restaurant.sampleData[1])
    }
}

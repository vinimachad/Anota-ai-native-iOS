//
//  RestaurantReviewsView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 27/09/22.
//

import SwiftUI

struct RestaurantReviewsView: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("Avaliações")
                .subHeaderFont()
            VStack(spacing: 16) {
                HStack(alignment: .top) {
                    Text(String(restaurant.evaluation))
                        .headerTitle()
                    Spacer()
                    VStack(alignment: .trailing, spacing: 1) {
                        listOfStars(
                            reviewStatus: [
                                ReviewStatus(value: 30, stars: 5),
                                ReviewStatus(value: 18, stars: 4),
                                ReviewStatus(value: 10, stars: 3),
                                ReviewStatus(value: 5, stars: 2),
                                ReviewStatus(value: 4, stars: 1)
                            ],
                            total: 100
                        )
                        Text("100 Avaliações")
                            .bodyFont()
                    }
                }
                TabView() {
                    ForEach(0..<3) { _ in
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Musica boa e comida deliciosa")
                                .bodyFont(color: .Texts.heading, weight: .bold)
                                .lineLimit(1)
                            HStack {
                                starsEvaluation(howMany: 5)
                                Spacer()
                                Text("Vinicius")
                                    .bodyFont()
                            }
                            .padding(.bottom)
                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the")
                                .bodyFont()
                                .lineLimit(4)
                        }
                        .padding(16)
                        .background(
                            Color.Shapes.box
                                .cornerRadius(4)
                                .shadow(color: .Shapes.stroke, radius: 4, x: 4, y: 2)
                        )
                    }.padding(.horizontal, 10)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(minHeight: 200)
            }
        }
    }
    
    private func starsEvaluation(howMany: Int) -> some View {
        HStack(alignment: .center, spacing: 2) {
            ForEach(0..<howMany, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 10, height: 10, alignment: .center)
                    .foregroundColor(.Others.yellow)
            }
        }
    }
    
    private func listOfStars(reviewStatus: [ReviewStatus], total: CGFloat) -> some View {
        ForEach(reviewStatus) { item in
            HStack {
                starsEvaluation(howMany: item.stars)
                ProgressView(value: item.value, total: total)
                    .progressViewStyle(LinearProgressViewStyle(tint: .Shapes.secondary))
                    .frame(maxWidth: 130)
            }
        }
    }
}

struct RestaurantReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantReviewsView(restaurant: Restaurant.sampleData[0])
    }
}

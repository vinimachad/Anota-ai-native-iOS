//
//  RestaurantReviewsView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 27/09/22.
//

import SwiftUI

struct RestaurantReviewsView: View {
    
    @StateObject var viewModel: RestaurantReviewsViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("Avaliações")
                .subHeaderFont()
            VStack(spacing: 16) {
                HStack(alignment: .top) {
                    Text(String(viewModel.evaluation))
                        .headerTitle()
                    Spacer()
                    VStack(alignment: .trailing, spacing: 1) {
                        listOfStars(
                            reviewStatus: viewModel.reviewsStatus,
                            total: viewModel.totalReviewsFloat
                        )
                        Text(viewModel.totalReviews)
                            .bodyFont()
                    }
                }
                listOfReviews()
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

extension RestaurantReviewsView {
    
    func listOfReviews() -> some View {
        TabView() {
            ForEach(viewModel.reviews) { review in
                VStack(alignment: .leading, spacing: 0) {
                    Text(review.title ?? "")
                        .bodyFont(color: .Texts.heading, weight: .bold)
                        .lineLimit(1)
                    HStack {
                        starsEvaluation(howMany: review.points)
                        Spacer()
                        Text(review.client.name)
                            .bodyFont()
                    }
                    .padding(.bottom)
                    Text(review.description)
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

struct RestaurantReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantReviewsView(viewModel: RestaurantReviewsViewModel(reviews: [], restaurant: Restaurant.sampleData[0]))
    }
}

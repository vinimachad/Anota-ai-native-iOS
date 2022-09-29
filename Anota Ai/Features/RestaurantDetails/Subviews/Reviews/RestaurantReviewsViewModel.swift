//
//  RestaurantReviewsViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 28/09/22.
//

import Foundation

class RestaurantReviewsViewModel: ObservableObject {
    
    @Published var reviews: [Review]
    @Published var restaurant: Restaurant
    
    init(reviews: [Review], restaurant: Restaurant) {
        self.reviews = reviews
        self.restaurant = restaurant
    }
}

extension RestaurantReviewsViewModel {
    
    var evaluation: String {
        String(restaurant.evaluation)
    }
    
    var totalReviewsFloat: CGFloat {
        CGFloat(reviews.count)
    }
    
    var totalReviews: String {
        if reviews.count < 1 || reviews.count > 1 {
            return "\(reviews.count) Avaliações"
        }
        return "\(reviews.count) Avaliação"
    }
    
    var reviewsStatus: [ReviewStatus] {
        [
            ReviewStatus(value: filterForStarsReviewsCount(star: 5), stars: 5),
            ReviewStatus(value: filterForStarsReviewsCount(star: 4), stars: 4),
            ReviewStatus(value: filterForStarsReviewsCount(star: 3), stars: 3),
            ReviewStatus(value: filterForStarsReviewsCount(star: 2), stars: 2),
            ReviewStatus(value: filterForStarsReviewsCount(star: 1), stars: 1)
        ]
    }
    
    func filterForStarsReviewsCount(star: Int) -> CGFloat {
        let reviewsCount = reviews.filter { $0.points == star }.count
        return CGFloat(reviewsCount)
    }
}

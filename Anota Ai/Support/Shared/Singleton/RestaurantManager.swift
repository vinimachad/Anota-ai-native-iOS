//
//  RestaurantInfos.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 30/09/22.
//

import Foundation

protocol RestaurantManagerProtocol {
    static var shared: RestaurantManager { get }
    func getSelectedRestaurant() -> Restaurant
    func setSelectedRestaurant(_ restaurant: Restaurant)
}

class RestaurantManager: RestaurantManagerProtocol {
    
    // MARK: - Public properties
    
    static var shared: RestaurantManager = RestaurantManager()
    
    // MARK: - Private properties
    
    private var selectedRestaurant: Restaurant?
    
    // MARK: Private init
    
    private init() { }
    
    // MARK: - Methods
    
    func getSelectedRestaurant() -> Restaurant {
        guard let selectedRestaurant else { return Restaurant() }
        return selectedRestaurant
    }
    
    func setSelectedRestaurant(_ restaurant: Restaurant) {
      selectedRestaurant = restaurant
    }
}

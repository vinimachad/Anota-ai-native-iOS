//
//  RestaurantDetailsList.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 27/09/22.
//

import SwiftUI


struct RestaurantDetailsListView: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Detalhes")
                .subHeaderFont()
            
            VStack {
                ForEach(restaurant.details, id: \.self) { item in
                    VStack {
                        HStack {
                            Text(item.title)
                                .bodyFont()
                            Spacer()
                            Text(item.value)
                                .bodyFont(color: .Texts.heading, weight: .bold)
                        }
                        Divider()
                    }
                }
            }
            
        }
    }
}

struct RestaurantDetailsList_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailsListView(restaurant: Restaurant.sampleData[0])
    }
}

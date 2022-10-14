//
//  Menu.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 30/09/22.
//

import Foundation

struct Menu: Decodable, Identifiable {
    var id: String
    var foods: [Food]
}

extension Menu {
    
    static var sample: Menu {
        Menu(
            id: "asdds",
            foods: [
                Food(id: "123", name: "Pizza brotinho", type: "pizza salgada", price: "23", previewUrl: "", description: "Lorem Ipsum is simply dummy text of the printing and typesetting"),
                Food(id: "1234", name: "Pizza quatro queijos", type: "pizza salgada", price: "42", previewUrl: "", description: "Industry. Lorem Ipsum has been the industry's standard dummy"),
                Food(id: "1235", name: "Pizza beijinho", type: "pizza doce", price: "46", previewUrl: "http://novavesuvio.pizzariasemlimeira.com.br/wp-content/uploads/pizza-beijinho-pizzaria-nova-vesuvio-limeira-sp-1024x843.jpg", description: "Text ever since the 1500s, when an unknown printer took a galley"),
                Food(id: "1236", name: "Pizza brigadeiro", type: "pizza doce", price: "34", previewUrl: "http://novavesuvio.pizzariasemlimeira.com.br/wp-content/uploads/pizza-brigadeiro-pizzaria-nova-vesuvio-limeira-sp-1024x843.jpg", description: "Of type and scrambled it to make a type specimen book. It has")
            ]
        )
    }
}

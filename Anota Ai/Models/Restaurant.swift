//
//  Restaurant.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 02/09/22.
//

import Foundation

struct Restaurant: Codable, Identifiable {
    var name: String = ""
    var avatarUrl: String = ""
    var type: String = ""
    var price: Int = 0
    var evaluation: Double = 0
    var id: String = ""
    var description: String = ""
    var details: [Detail] = []
    
    func evaluationToInt() -> Int {
        Int(evaluation)
    }
    
    func formatEvaluation() -> String {
        String(format: "%.1f", evaluation)
    }
    
    struct Detail: Codable, Hashable {
        var title: String
        var value: String
    }
}

extension Restaurant {
    static var sampleData: [Restaurant] = [
        Restaurant(
            name: "Madalena rodizios e pizzaria",
            avatarUrl: "https://static-images.ifood.com.br/image/upload/t_thumbnail/logosgde/201901141006_46e0009d-2d6f-4de3-a6a4-26c2cd41120c.jpg",
            type: "Pizzaria",
            price: 4,
            evaluation: 3.4,
            id: "asdasd",
            description: "A melhor pizzaria de Campo Grande Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            details: [Detail(title: "Endereço", value: "R. Araras, 187, São Francisco")]
        ),
        Restaurant(
            name: "Minimus",
            avatarUrl: "https://scontent.fcgr5-1.fna.fbcdn.net/v/t1.6435-9/123654865_4158739037475747_3706163940154592273_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=AvxKk73G3yMAX9snsJ2&_nc_ht=scontent.fcgr5-1.fna&oh=00_AT-Q2vdnHEX4KT4_pW1WOLqdqqq1TxPflJNYEOtAJTL4kw&oe=63399E06",
            type: "Rodizio",
            price: 4,
            evaluation: 3.4,
            id: "asdasd",
            description: "A melhor pizzaria de Campo Grande Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            details: [Detail(title: "Endereço", value: "R. Araras, 187, São Francisco")]
        )
    ]
}

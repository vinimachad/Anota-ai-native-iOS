//
//  CircleRestaurantsView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/09/22.
//

import SwiftUI
import Kingfisher

struct CircleRestaurantsView: View {
    
    @State var url: URL?
    @State var name: String
    
    var body: some View {
        VStack {
            KFImage.url(url)
                .resizable()
                .fade(duration: 0.25)
                .onProgress { receivedSize, totalSize in  }
                .onSuccess { result in  }
                .onFailure { error in }
                .clipShape(Circle())
                .frame(width: 83, height: 83, alignment: .center)
                .scaledToFill()
            
            Text(name)
                .foregroundColor(.Texts.body)
                .font(.default(type: .regular, ofSize: 14))
            
        }.lineSpacing(6)
    }
}

struct CircleRestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        CircleRestaurantsView(url: URL(string: "https://static-images.ifood.com.br/image/upload/t_thumbnail/logosgde/201901141006_46e0009d-2d6f-4de3-a6a4-26c2cd41120c.jpg"), name: "Madalena")
    }
}

//
//  NearPreviewImage.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 15/09/22.
//

import SwiftUI

struct NearPreviewImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 100, alignment: .center)
            .clipped()
    }
}

struct NearPreviewImage_Previews: PreviewProvider {
    static var previews: some View {
        NearPreviewImage(image: Image(systemName: "photo"))
    }
}

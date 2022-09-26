//
//  HeaderView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 25/09/22.
//

import SwiftUI

struct HeaderView: View {
    
    private var name: String? {
        "Olá, \(UserSessionManager.shared.getUserSession()?.name ?? "") 👋"
    }
    
    var body: some View {
        ZStack {
            Color.clear
                .background(Color.Shapes.box)
                .blur(radius: 5)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(name ?? "")
                    .font(.largeTitle)
                    .foregroundColor(.Texts.heading)
                Text("Bem-vindo ao Anota ai")
                    .font(.default(type: .regular, ofSize: 16))
                    .foregroundColor(.Texts.body)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(height: 70)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}

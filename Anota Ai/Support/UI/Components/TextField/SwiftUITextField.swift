//
//  SwiftUITextField.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 19/10/22.
//

import SwiftUI

struct SwiftUITextField: View {
    
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .bodyFont(color: Color(uiColor: .systemGray))
            }
            TextField("", text: $text)
                .textInputAutocapitalization(.never)
        }
        .padding()
        .foregroundColor(.Texts.body)
        .frame(height: 48)
        .background(
            Color(uiColor: .systemGray6)
                .cornerRadius(8)
        )
        .padding()
    }
}

struct SwiftUITextField_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITextField(text: .constant(""), placeholder: "Busque pelo seu prato...")
    }
}

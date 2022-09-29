//
//  NavigationBarBackButton.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 27/09/22.
//

import Foundation
import SwiftUI

extension View {
    
    func defaultBackButton(presentationMode: Binding<PresentationMode>) -> some View {
        
        return self
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: .Images.back)
                            .foregroundColor(.Brand.secondary)
                    }
                }
            }
    }
}

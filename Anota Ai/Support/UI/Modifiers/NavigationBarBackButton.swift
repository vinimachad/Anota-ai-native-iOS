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
            .environment(\.colorScheme, .light)
            .overlay(alignment: .top, content: {
                Color.clear
                    .background(.thinMaterial)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 0)
            })
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

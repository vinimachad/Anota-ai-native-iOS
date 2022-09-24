//
//  View+ShimmerEffect.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 24/09/22.
//

import SwiftUI

struct ShimmerEffectMod: ViewModifier {
    
    @State var opacity: Double
    
    func body(content: Content) -> some View {
        content
            .opacity(opacity)
            .transition(.opacity)
            .onAppear {
                let baseAnimation = Animation.easeInOut(duration: 1)
                let repeated = baseAnimation.repeatForever(autoreverses: true)
                withAnimation(repeated) {
                    opacity = 0.9
                }
            }
    }
}

extension View {
    
    func shimmerEffect(opacity: Double) -> some View {
        modifier(ShimmerEffectMod(opacity: opacity))
    }
}

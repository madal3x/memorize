//
//  Cardify.swift
//  Memorize
//
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        let rr = RoundedRectangle(cornerRadius: 20)
        if isFaceUp {
            rr.fill().foregroundColor(.white)
            rr.strokeBorder(lineWidth: 3)
        } else {
            rr.fill()
        }
        // content has to be on screen to be animated on isMatched change
        content.opacity(isFaceUp ? 1 : 0)
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}

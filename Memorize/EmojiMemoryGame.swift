//
//  EmojiMemoryGame.swift
//  Memorize
//
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🍔", "🍕", "🥙", "🥟", "🍤", "🍨", "🧁", "🍩", "🍥", "🥮", "☕️", "🧊", "🌭", "🥩", "🍗", "🍖", "🦴", "🥘", "🍝", "🥜", "🍭"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairs: 4) { pairIndex in emojis[pairIndex] }
    }
    
    @Published private(set) var model: MemoryGame<String> = createMemoryGame()
        
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func choose(card: MemoryGame<String>.Card) {
        print("\(card)")
        model.choose(card)
    }
}

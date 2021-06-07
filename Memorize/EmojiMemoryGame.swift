//
//  EmojiMemoryGame.swift
//  Memorize
//
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    static let emojis = ["🍔", "🍕", "🥙", "🥟", "🍤", "🍨", "🧁", "🍩", "🍥", "🥮", "☕️", "🧊", "🌭", "🥩", "🍗", "🍖", "🦴", "🥘", "🍝", "🥜", "🍭"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairs: 4) { pairIndex in emojis[pairIndex] }
    }
    
    @Published private(set) var model = createMemoryGame()
        
    
    var cards: Array<Card> {
        model.cards
    }
    
    func choose(card: Card) {
        print("\(card)")
        model.choose(card)
    }
}

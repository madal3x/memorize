//
//  EmojiMemoryGame.swift
//  Memorize
//
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    static let emojis = ["ð", "ð", "ðĨ", "ðĨ", "ðĪ", "ðĻ", "ð§", "ðĐ", "ðĨ", "ðĨŪ", "âïļ", "ð§", "ð­", "ðĨĐ", "ð", "ð", "ðĶī", "ðĨ", "ð", "ðĨ", "ð­"]
    
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

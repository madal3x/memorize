//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Alexandru Madan on 18.05.2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}

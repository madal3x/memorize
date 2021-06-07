//
//  EmojiMemoryGameView.swift
//  Memorize
//
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits(cardCount: game.cards.count)))]) {
                ForEach(game.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card: card)
                        }
                }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                let rr = RoundedRectangle(cornerRadius: 20)
                if card.isFaceUp {
                    rr.fill().foregroundColor(.white)
                    rr.strokeBorder(lineWidth: 3)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched {
                    rr.opacity(0)
                } else {
                    rr.fill()
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * 0.8)
    }
}

struct Emojis {
    static let bodyParts = (label: "Body Parts", imageName: "nose",
                            emojis: ["🧠", "🫀", "🦷", "💋", "👅", "👂", "👀", "🦶🏻", "🤚", "👃"])
    
    static let food = (label: "Food", imageName: "leaf",
                       emojis: ["🍔", "🍕", "🥙", "🥟", "🍤", "🍨", "🧁", "🍩", "🍥", "🥮", "☕️", "🧊", "🌭", "🥩", "🍗", "🍖", "🦴", "🥘", "🍝", "🥜", "🍭"])
    
    static let people = (label: "People", imageName: "figure.wave",
                         emojis: ["🕵️‍♀️", "👨🏾‍🍳", "👩🏻‍🚒", "🧝🏻‍♂️", "🙅🏾‍♀️", "👯‍♂️", "👩🏼‍🦽", "💃"])
}

func widthThatBestFits(cardCount: Int) -> CGFloat {
    let sqr: Double = Double(cardCount).squareRoot()
    let dv = (sqr == sqr.significand)
        ? sqr
        : (sqr + 1)
    return (UIScreen.main.bounds.size.width - 30) / CGFloat(dv)
}


























struct ContentView_Previews: PreviewProvider {
    static let game = EmojiMemoryGame()
    
    static var previews: some View {
        EmojiMemoryGameView(game: game).preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        EmojiMemoryGameView(game: game).preferredColorScheme(.light)
    }
}

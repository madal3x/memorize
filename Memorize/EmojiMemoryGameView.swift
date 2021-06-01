//
//  EmojiMemoryGameView.swift
//  Memorize
//
//

import SwiftUI

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

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits(cardCount: viewModel.cards.count)))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card: card)
                        }
                }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack(alignment: .center) {
            let rr = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                rr.fill().foregroundColor(.white)
                rr.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                rr.opacity(0)
            } else {
                rr.fill()
            }
        }
    }
}




























struct ContentView_Previews: PreviewProvider {
    static let game = EmojiMemoryGame()
    
    static var previews: some View {
        EmojiMemoryGameView(viewModel: game).preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        EmojiMemoryGameView(viewModel: game).preferredColorScheme(.light)
    }
}

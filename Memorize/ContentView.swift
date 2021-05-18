//
//  ContentView.swift
//  Memorize
//
//

import SwiftUI

struct ContentView: View {
    let bodyParts = ["🧠", "🫀", "🦷", "💋", "👅", "👂", "👀", "🦶🏻", "🤚", "👃"]
    let food = ["🍔", "🍕", "🥙", "🥟", "🍤", "🍨", "🧁", "🍩", "🍥", "🥮", "☕️", "🧊", "🌭", "🥩", "🍗", "🍖", "🦴", "🥘", "🍝", "🥜", "🍭"]
    let people = ["🕵️‍♀️", "👨🏾‍🍳", "👩🏻‍🚒", "🧝🏻‍♂️", "🙅🏾‍♀️", "👯‍♂️", "👩🏼‍🦽", "💃"]
    
    @State var emojis: [String] = ["🧠", "🫀", "🦷", "💋", "👅", "👂", "👀", "🦶🏻", "🤚", "👃"]
    
    @State var cnt = 4
    
    func widthThatBestFits(cardCount: Int) -> CGFloat {
        let sqr: Double = Double(cardCount).squareRoot()
        let dv = (sqr == sqr.significand)
            ? sqr
            : (sqr + 1)
        return CGFloat(320 / dv)
    }
    
    var body: some View {
        VStack {
            Text("Memorize!")
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits(cardCount: cnt)))]) {
                    ForEach(emojis[0..<cnt], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                add
                Spacer()
                changeEmojis(label: "Body Parts", imageName: "nose", emojisNew: bodyParts)
                changeEmojis(label: "Food", imageName: "leaf", emojisNew: food)
                changeEmojis(label: "People", imageName: "figure.wave", emojisNew: people)
                Spacer()
                remove
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
    
    var add: some View {
        Button{
            cnt = (cnt == emojis.count) ? cnt : cnt + 1
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var remove: some View {
        Button {
            cnt = cnt > 0 ? cnt - 1 : 0
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    func changeEmojis(label: String, imageName: String, emojisNew: [String]) -> some View {
        Button {
            emojis = emojisNew.shuffled()
            cnt = 4
        } label: {
            VStack {
                Image(systemName: imageName)
                Text(label).font(.caption)
            }
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack(alignment: .center) {
            let rr = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                rr.fill().foregroundColor(.white)
                rr.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                rr.fill()
            }
            
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}




























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        ContentView().preferredColorScheme(.light)
    }
}

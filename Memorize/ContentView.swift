//
//  ContentView.swift
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

struct ContentView: View {
    @State var emojis: [String] = Emojis.bodyParts.emojis
    
    @State var cnt = 4
    
    func widthThatBestFits(cardCount: Int) -> CGFloat {
        let sqr: Double = Double(cardCount).squareRoot()
        let dv = (sqr == sqr.significand)
            ? sqr
            : (sqr + 1)
        return (UIScreen.main.bounds.size.width - 30) / CGFloat(dv)
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
                changeEmojis(Emojis.bodyParts.label, Emojis.bodyParts.imageName, Emojis.bodyParts.emojis)
                changeEmojis(Emojis.food.label, Emojis.food.imageName, Emojis.food.emojis)
                changeEmojis(Emojis.people.label, Emojis.people.imageName, Emojis.people.emojis)
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
    
    func changeEmojis(_ label: String, _ imageName: String, _ emojisNew: [String]) -> some View {
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

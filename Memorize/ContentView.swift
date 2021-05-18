//
//  ContentView.swift
//  Memorize
//
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🧠", "🫀", "🦷", "💋",  "👨🏽‍🚀",  " 👡",  "🐁",  "🧊",  "🥎",  "🏨",  "📨",  "💝",  "🛵",  "🌞",  "🧑🏻‍🎄",  "🐽",  "☔️",  "🍛"]
    @State var cnt = 2
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
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

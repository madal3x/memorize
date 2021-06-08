//
//  AspectVGrid.swift
//  Memorize
//
//

import SwiftUI

struct AspectVGrid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var aspectRatio: CGFloat
    var content: (Item) -> ItemView
    
    var body: some View {
        GeometryReader { geometry in
            // added VStack + Spacer to make this flexible space
            VStack {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits(itemCount: items.count, in: geometry.size)))]) {
                    ForEach(items) { item in
                        content(item).aspectRatio(aspectRatio, contentMode: .fit)
                    }
                }
            }
            Spacer(minLength: 0)
        }
    }
    
    private func widthThatBestFits(itemCount: Int, in size: CGSize) -> CGFloat {
        let sqr: Double = Double(itemCount).squareRoot()
        let dv = (sqr == sqr.significand)
            ? sqr
            : (sqr + 1)
        return (UIScreen.main.bounds.size.width - 30) / CGFloat(dv)
    }
}

//struct AdaptiveVGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        AdaptiveVGrid()
//    }
//}

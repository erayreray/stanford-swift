//
//  CardView.swift
//  stanford-swift
//
//  Created by Erin Smith on 11/5/24.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Card

    let card: Card
    
    init (_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        Pie(endAngle: .degrees(240))
            .opacity(Constants.Pie.opacity)
            .overlay(
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.Pie.inset)
                    
            )
            .padding(Constants.inset)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
    
    private struct Constants {
        static let cornertRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 5
        }
    }
}

typealias Card = CardView.Card
#Preview {
    VStack {
        HStack{
            CardView(Card(isFaceUp: true, content: "X", id: "test1"))
            CardView(Card(content: "X", id: "test1"))
        }
        HStack{
            CardView(Card(isFaceUp: true, isMatched: true, content: "This is a very long string that will wrap around the card", id: "test1"))
            CardView(Card(isMatched: true, content: "X", id: "test1"))
        }
    }
        .padding()
        .foregroundColor(.green)
}

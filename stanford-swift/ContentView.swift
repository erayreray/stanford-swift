//
//  ContentView.swift
//  stanford-swift
//
//  Created by Erin Smith on 9/20/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["😈", "🐈‍⬛", "👻", "🎃","🙀","🧙‍♀️","☠️","🍭","🕷️"]
    @State var cardCount: Int = 4
    
    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(), GridItem()]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base.foregroundColor(Color.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 2))
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}











#Preview {
    ContentView()
}

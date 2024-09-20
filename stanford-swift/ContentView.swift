//
//  ContentView.swift
//  stanford-swift
//
//  Created by Erin Smith on 9/20/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["😈", "🐈‍⬛", "👻", "🎃"]
    
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(Color.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.foregroundColor(Color.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 2))
                
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}











#Preview {
    ContentView()
}

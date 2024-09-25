//
//  MemorizeGame.swift
//  stanford-swift
//
//  Created by Erin Smith on 9/25/24.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card]
    
    func choose(card: Card) {
         
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}

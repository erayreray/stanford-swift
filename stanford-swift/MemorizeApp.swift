//
//  stanford_swiftApp.swift
//  stanford-swift
//
//  Created by Erin Smith on 9/20/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}

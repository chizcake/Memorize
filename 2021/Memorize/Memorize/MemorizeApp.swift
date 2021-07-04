//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Henry Yoo on 2021/05/26.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let viewModel = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: viewModel)
        }
    }
}

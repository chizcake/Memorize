//
//  EmojiMemoryGameViewModel.swift
//  Memorize
//
//  Created by Henry Yoo on 2021/05/29.
//

import SwiftUI

final class EmojiMemoryGameViewModel {
    private static let emojis: [String] = [
        "🚘", "⛵️", "🚀", "✈️", "🛴",
        "🛵", "🚡", "⛴", "🛰", "🛸",
        "🛩", "🚤", "🚌", "🚲", "🚂",
    ]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(
            numberOfPairsOfCards: 4,
            createCardContent: { emojis[$0] }
        )
    }
    
    private let model: MemoryGame<String> = EmojiMemoryGameViewModel.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
}

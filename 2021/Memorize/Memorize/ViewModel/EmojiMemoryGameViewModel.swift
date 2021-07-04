//
//  EmojiMemoryGameViewModel.swift
//  Memorize
//
//  Created by Henry Yoo on 2021/05/29.
//

import SwiftUI

final class EmojiMemoryGameViewModel: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGameViewModel.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

extension EmojiMemoryGameViewModel {
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
}

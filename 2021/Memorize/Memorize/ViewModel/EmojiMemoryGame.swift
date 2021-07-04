//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Henry Yoo on 2021/05/29.
//

import SwiftUI

final class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card

    @Published private var model = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}

extension EmojiMemoryGame {
    private static let emojis = [
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

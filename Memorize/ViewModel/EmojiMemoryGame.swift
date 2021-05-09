//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by HENRY YOO on 2021/05/09.
//

import SwiftUI

final class EmojiMemoryGame {
    private var game: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()

    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃", "🍬"]
        return MemoryGame(numberOfPairsOfCards: emojis.count) { pairIndex in
            emojis[pairIndex]
        }
    }

    // MARK: - Access to the Model

    var cards: Array<MemoryGame<String>.Card> {
        game.cards
    }

    // MARK: - Intent(s)

    func choose(_ card: MemoryGame<String>.Card) {
        game.choose(card)
    }
}

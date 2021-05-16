//
//  EmojiMemoryGameViewModel.swift
//  Memorize
//
//  Created by HENRY YOO on 2021/05/09.
//

import SwiftUI

final class EmojiMemoryGameViewModel: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGameViewModel.createMemoryGame()

    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃", "🍬"]
        return MemoryGame(numberOfPairsOfCards: emojis.count) { pairIndex in
            emojis[pairIndex]
        }
    }

    // MARK: - Access to the Model

    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }

    // MARK: - Intent(s)

    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

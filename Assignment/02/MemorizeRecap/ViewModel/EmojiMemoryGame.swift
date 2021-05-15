//
//  EmojiMemoryGame.swift
//  MemorizeRecap
//
//  Created by HENRY YOO on 2021/05/15.
//

import Foundation

final class EmojiMemoryGame {
    private let game: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()

    private static func createMemoryGame() -> MemoryGame<String> {
        var emojis: Array<String> = ["🍬", "🎃", "👻", "👽", "👿"]
        let numberOfPairs: Int = Int.random(in: 2...5)
        emojis.shuffle()

        return MemoryGame(numberOfPairsOfCards: numberOfPairs) { (index: Int) in
            emojis[index]
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

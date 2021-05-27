//
//  MemoryGame.swift
//  MemorizeRecap
//
//  Created by HENRY YOO on 2021/05/12.
//

import Foundation

struct MemoryGame<CardContent> {
    let cards: Array<Card>

    init(numberOfPairsOfCards: Int, cardFactory: (Int) -> CardContent) {
        var cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = cardFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }

        // Shuffle cards
        cards.shuffle()

        self.cards = cards
    }

    func choose(_ card: Card) {
        print(card)
    }
}

extension MemoryGame {
    struct Card: Identifiable {
        var id: Int
        var content: CardContent
        var isFacedUp: Bool = true
        var isMatched: Bool = false
    }
}

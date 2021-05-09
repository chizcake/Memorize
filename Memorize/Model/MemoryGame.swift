//
//  MemoryGame.swift
//  Memorize
//
//  Created by HENRY YOO on 2021/05/09.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
    }

    func choose(_ card: Card) {
        print("Card chosen: \(card)")
    }
}

extension MemoryGame {
    struct Card: Identifiable {
        var id: Int
        var isFacedUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
}

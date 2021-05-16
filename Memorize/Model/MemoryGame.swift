//
//  MemoryGame.swift
//  Memorize
//
//  Created by HENRY YOO on 2021/05/09.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    private(set) var cards: Array<Card>

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
    }

    mutating func choose(_ card: Card) {
        print("Card chosen: \(card)")

        if let chosenIndex: Int = cards.firstIndex(of: card) {
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
}

extension MemoryGame {
    struct Card: Identifiable, Equatable {
        var id: Int
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
}

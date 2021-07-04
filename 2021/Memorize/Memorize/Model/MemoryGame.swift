//
//  MemoryGame.swift
//  Memorize
//
//  Created by Henry Yoo on 2021/05/29.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    private(set) var cards: Array<Card>

    private var indexOfTheOneAndOnlyFaceUpCard: Int?

    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()

        // Add numberOfPairsOfCards * 2 cards to `cards` array.
        for pairIndex in 0..<numberOfPairsOfCards {
            let cardContent = createCardContent(pairIndex)
            cards.append(Card(id: 2 * pairIndex, content: cardContent))
            cards.append(Card(id: 2 * pairIndex + 1, content: cardContent))
        }
    }

    mutating func choose(_ card: Card) {
        guard let chosenIndex = cards.firstIndex(of: card),
              cards[chosenIndex].isFaceUp == false,
              cards[chosenIndex].isMatched == false
        else {
            return
        }

        if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
            if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                cards[chosenIndex].isMatched = true
                cards[potentialMatchIndex].isMatched = true
            }
            indexOfTheOneAndOnlyFaceUpCard = nil
        }
        else {
            for index in cards.indices {
                cards[index].isFaceUp = false
            }

            indexOfTheOneAndOnlyFaceUpCard = chosenIndex
        }

        cards[chosenIndex].isFaceUp.toggle()
    }
}

// MARK: - Card

extension MemoryGame {
    struct Card: Equatable, Identifiable {
        let id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}

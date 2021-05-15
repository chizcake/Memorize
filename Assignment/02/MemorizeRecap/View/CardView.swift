//
//  CardView.swift
//  MemorizeRecap
//
//  Created by HENRY YOO on 2021/05/12.
//

import SwiftUI

struct CardView: View {
    var card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            if card.isFacedUp {
                RoundedRectangle(cornerRadius: 5).fill(Color.white)
                RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 2)
                Text(card.content)
            }
            else {
                RoundedRectangle(cornerRadius: 5).fill()
            }
        }
        .foregroundColor(.orange)
    }
}

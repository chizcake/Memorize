//
//  CardView.swift
//  Memorize
//
//  Created by HENRY YOO on 2021/05/16.
//

import SwiftUI

struct CardView: View {
    var card: MemoryGame<String>.Card

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                }
                else {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
            .debugPrint(geometry.size)
            .font(.system(size: fontSize(geometry.size)))
        }
    }

    private func fontSize(_ size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }

    // MARK: - Drawing Constants

    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3.0
    let fontScaleFactor: CGFloat = 0.75
}

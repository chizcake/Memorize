//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by HENRY YOO on 2021/05/09.
//

import SwiftUI
import Combine

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGameViewModel

    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .onTapGesture { viewModel.choose(card) }
            }
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGameViewModel())
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .previewDisplayName("iPhone 12")

        EmojiMemoryGameView(viewModel: EmojiMemoryGameViewModel())
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
            .environment(\.colorScheme, .dark)
    }
}

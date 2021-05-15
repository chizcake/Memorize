//
//  ContentView.swift
//  MemorizeRecap
//
//  Created by HENRY YOO on 2021/05/12.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame

    var body: some View {
        HStack {
            ForEach(viewModel.cards) { (card: MemoryGame<String>.Card) in
                CardView(card: card)
                    // Have the font adjust in the 5 pair case(only) to use a smaller font than `.largeTitle`.
                    .font(viewModel.cards.count >= 10 ? .body : .largeTitle)
                    // Force each card to have a width to height ratio of 2:3.
                    .aspectRatio(2 / 3, contentMode: .fit)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))

        ContentView(viewModel: EmojiMemoryGame())
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .environment(\.colorScheme, .dark)
    }
}

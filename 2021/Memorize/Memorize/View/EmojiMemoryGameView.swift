//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Henry Yoo on 2021/05/26.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                ForEach(game.cards) { card in
                    CardView(card)
                        .aspectRatio(2 / 3, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.purple)
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EmojiMemoryGame()
        
        EmojiMemoryGameView(game: viewModel)
            .preferredColorScheme(.light)
        
        EmojiMemoryGameView(game: viewModel)
            .preferredColorScheme(.dark)
    }
}

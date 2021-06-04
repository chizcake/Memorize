//
//  ContentView.swift
//  Memorize
//
//  Created by Henry Yoo on 2021/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var emojiCount: Int = 6
    var emojis: [String] = [
        "🚘", "⛵️", "🚀", "✈️", "🛴",
        "🛵", "🚡", "⛴", "🛰", "🛸",
        "🛩", "🚤", "🚌", "🚲", "🚂",
    ]

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2 / 3, contentMode: .fit)
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
        ContentView()
            .preferredColorScheme(.light)
        
        ContentView()
            .preferredColorScheme(.dark)
    }
}

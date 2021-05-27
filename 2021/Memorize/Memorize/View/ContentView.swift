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
            .foregroundColor(.purple)
            Spacer()
            HStack {
                removeButton
                Spacer()
                addButton
            }
            .font(.title)
            .padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    private var addButton: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        }
        label: {
            Image(systemName: "plus.circle")
        }
    }
    
    private var removeButton: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        }
        label: {
            Image(systemName: "minus.circle")
        }
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

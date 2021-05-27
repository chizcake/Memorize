//
//  ContentView.swift
//  Memorize
//
//  Created by Henry Yoo on 2021/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var emojis: [String] = [
        "🚘", "⛵️", "🚀", "✈️", "🛴",
        "🛵", "🚡", "⛴", "🛰", "🛸",
        "🛩", "🚤", "🚌", "🚲", "🚂",
    ]

    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .fontWeight(.black)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis, id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2 / 3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.purple)
            Spacer()
            HStack {
                Spacer()
                transportationThemeButton
                Spacer()
                animalThemeButton
                Spacer()
                emotionThemeButton
                Spacer()
            }
            .font(.body)
            .padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    private var transportationThemeButton: some View {
        Button {
            emojis = [
                "🚘", "⛵️", "🚀", "✈️", "🛴",
                "🛵", "🚡", "⛴", "🛰", "🛸",
                "🛩", "🚤", "🚌", "🚲", "🚂",
            ]
            emojis.shuffle()
        }
        label: {
            VStack {
                Image(systemName: "car")
                    .font(.largeTitle)
                Text("Vehicles")
                    .font(.caption)
            }
        }
    }
    
    private var animalThemeButton: some View {
        Button {
            emojis = [
                "🐶", "🐭", "🐱", "🐹", "🐰",
                "🦊", "🐻", "🐼", "🐻‍❄️", "🐨",
                "🐯", "🦁", "🐮", "🐷", "🐵",
                "🐤", "🦄", "🐙",
            ]
            emojis.shuffle()
        }
        label: {
            VStack {
                Image(systemName: "hare")
                    .font(.largeTitle)
                Text("Animals")
                    .font(.caption)
            }
        }
    }
    
    private var emotionThemeButton: some View {
        Button {
            emojis = [
                "😍", "😋", "🤪", "🧐", "😆",
                "😅", "🥳", "😏", "😫", "🤩",
                "🤓", "🥺", "😭", "😤", "🤯",
                "🤬", "🥶", "🤫", "🤢", "🤑",
            ]
            emojis.shuffle()
        }
        label: {
            VStack {
                Image(systemName: "face.smiling")
                    .font(.largeTitle)
                Text("Emotions")
                    .font(.caption)
            }
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

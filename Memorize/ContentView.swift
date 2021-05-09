//
//  ContentView.swift
//  Memorize
//
//  Created by HENRY YOO on 2021/05/09.
//

import SwiftUI

struct ContentView: View {
    var isFacedUp: Bool = false

    var body: some View {
        HStack {
            ForEach(0..<4) { _ in
                CardView(isFacedUp: isFacedUp)
            }
        }
        .padding()
        .foregroundColor(.orange)
        .font(.largeTitle)
    }
}

struct CardView: View {
    var isFacedUp: Bool

    var body: some View {
        if isFacedUp {
            ZStack {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text("👻")
            }
        }
        else {
            RoundedRectangle(cornerRadius: 10).fill()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .previewDisplayName("iPhone 12")

        ContentView(isFacedUp: true)
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
            .environment(\.colorScheme, .dark)
    }
}

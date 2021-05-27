//
//  ContentView.swift
//  Memorize
//
//  Created by Henry Yoo on 2021/05/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            ForEach(0..<4) { _ in
                ZStack {
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(Color.white)
                    RoundedRectangle(cornerRadius: 20.0)
                        .stroke(lineWidth: 3.0)
                    Text("🚘")
                        .font(.largeTitle)
                }
            }
        }
        .padding(.horizontal)
        .foregroundColor(.accentColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

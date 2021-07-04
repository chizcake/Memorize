//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Henry Yoo on 2021/05/26.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let viewModel = EmojiMemoryGameViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}

//
//  MemorizeRecapApp.swift
//  MemorizeRecap
//
//  Created by HENRY YOO on 2021/05/12.
//

import SwiftUI

@main
struct MemorizeRecapApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: EmojiMemoryGame())
        }
    }
}

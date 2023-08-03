//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Котенок Майнкун on 10.07.2023.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}

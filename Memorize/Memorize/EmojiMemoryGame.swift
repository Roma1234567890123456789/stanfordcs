//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Котенок Майнкун on 23.07.2023.
// This is ViewModel

import SwiftUI

class EmojiMemoryGame: ObservableObject {


    static var emojis = ["🚕", "🚜", "🏎️", "🚑", "🚓", "🚒", "🛻", "🚗",
                         "🚁", "✈️", "🚀", "🛸", "🚠", "🚟", "🛩️", "🛰️",
                         "🛶", "⛵️", "🛟", "🚤", "🛥️", "🛳️", "⛴️", "⚓️"]

    static func createEmojis(theme: String) -> [String] {
        switch theme {
            case "cars":
                return ["🚕", "🚜", "🏎️", "🚑", "🚓", "🚒", "🛻", "🚗"]
            case "planes":
                return ["🚁", "✈️", "🚀", "🛸", "🚠", "🚟", "🛩️", "🛰️"]
            case "ships":
                return ["🛶", "⛵️", "🛟", "🚤", "🛥️", "🛳️", "⛴️", "⚓️"]
            case "animals":
                return ["🐗", "🦒", "🐽", "🐎", "🙈", "🐮", "🐶", "🦘"]
            case "reptiles":
                return ["🦎", "🐢", "🐍", "🐊", "🐸", "🐉", "🦕", "🦖"]
            case "fishes":
                return ["🐳", "🐋", "🦈", "🐠", "🐡", "🦑", "🐬", "🦞"]
            case "moon":
                return ["🌕", "🌖", "🌗", "🌘", "🌑", "🌒", "🌓", "🌔"]
            default:
                return []
        }
    }
    
    static func newGame(theme: String, numberOfPairs: Int, cardColor: Color) -> MemoryGame<String> {
        let emojis = createEmojis(theme: theme)
        return MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
            emojis[pairIndex]
        }
    }

    @Published var model: MemoryGame<String> = newGame(theme: "cars", numberOfPairs: 8, cardColor: .red)

    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    // MARK: - Intent(s)

    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

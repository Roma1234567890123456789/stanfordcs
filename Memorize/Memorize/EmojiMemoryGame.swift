//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Котенок Майнкун on 23.07.2023.
// This is ViewModel

import SwiftUI

class EmojiMemoryGame: ObservableObject {

    #warning("Remove below function")
    static func createEmojis(theme: String) -> [String] {
        switch theme {
            case "cars":
                return ["🚕", "🚜", "🏎️", "🚑", "🚓", "🚒", "🛻", "🚗"].shuffled()
            case "planes":
                return ["🚁", "✈️", "🚀", "🛸", "🚠", "🚟", "🛩️", "🛰️"].shuffled()
            case "ships":
                return ["🛶", "⛵️", "🛟", "🚤", "🛥️", "🛳️", "⛴️", "⚓️"].shuffled()
            case "animals":
                return ["🐗", "🦒", "🐽", "🐎", "🙈", "🐮", "🐶", "🦘"].shuffled()
            case "reptiles":
                return ["🦎", "🐢", "🐍", "🐊", "🐸", "🐉", "🦕", "🦖"].shuffled()
            case "fishes":
                return ["🐳", "🐋", "🦈", "🐠", "🐡", "🦑", "🐬", "🦞"].shuffled()
            case "moon":
                return ["🌕", "🌖", "🌗", "🌘", "🌑", "🌒", "🌓", "🌔"].shuffled()
            default:
                return []
        }
    }

    #warning("refactor the below code, se the newGame() method takes only the game theme and nothing else")
    static func newGame(themeName: String, numberOfPairs: Int, cardColor: Color) -> MemoryGame<String> {
        let emojis = createEmojis(theme: themeName)
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairs, cardColor: cardColor)
        { pairIndex in
            emojis[pairIndex]
        }
    }

    @Published var model: MemoryGame<String> = newGame(themeName: "cars", numberOfPairs: 8, cardColor: .red)
    

    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    // MARK: - Intent(s)

    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

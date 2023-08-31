import SwiftUI

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    // var theme: GameTheme
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
       
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
}

struct GameTheme {
    var name: String
    let emojis: [String]
    let cardColor: Color
    let symbolName: String
    
    static var themes: [GameTheme] = [
        GameTheme(name: "cars", emojis: ["🚕", "🚜", "🏎️", "🚑", "🚓", "🚒", "🛻", "🚗"], cardColor: .red, symbolName: "car.circle"),
        GameTheme(name: "planes", emojis: ["🚁", "✈️", "🚀", "🛸", "🚠", "🚟", "🛩️", "🛰️"], cardColor: .blue, symbolName: "airplane.circle"),
        GameTheme(name: "ships", emojis: ["🛶", "⛵️", "🛟", "🚤", "🛥️", "🛳️", "⛴️", "⚓️"], cardColor: .green, symbolName: "ship"),
        GameTheme(name: "animals", emojis: ["🐗", "🦒", "🐽", "🐎", "🙈", "🐮", "🐶", "🦘"], cardColor: .orange, symbolName: "hare"),
        GameTheme(name: "reptiles", emojis: ["🦎", "🐢", "🐍", "🐊", "🐸", "🐉", "🦕", "🦖"], cardColor: .purple, symbolName: "tortoise"),
        GameTheme(name: "fishes", emojis: ["🐳", "🐋", "🦈", "🐠", "🐡", "🦑", "🐬", "🦞"], cardColor: .pink, symbolName: "fish"),
        GameTheme(name: "moon", emojis: ["🌕", "🌖", "🌗", "🌘", "🌑", "🌒", "🌓", "🌔"], cardColor: .gray, symbolName: "moon.circle"),
    ]
}

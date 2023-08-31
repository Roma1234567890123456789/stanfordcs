import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var game: MemoryGame<String>
    @Published private(set) var selectedTheme: GameTheme
    
    init() {
        self.game = MemoryGame(numberOfPairsOfCards: 4, createCardContent: EmojiMemoryGame.createCardContent(_:))
        self.selectedTheme = GameTheme.themes.randomElement()!
    }
    
    var themeOptions: [GameTheme] {
        GameTheme.themes
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        game.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        game.choose(card)
    }
    
    func setSelectedTheme(to newValue: GameTheme) {
        selectedTheme = newValue
    }
    
    static func createCardContent(_ index: Int) -> String {
        return "🐳"
    }
    
    func newGame() {
        
    }
}


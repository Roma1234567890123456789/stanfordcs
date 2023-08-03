//
//   MemoryGame.swift
//  Memorize
//
//  Created by Котенок Майнкун on 23.07.2023.
// This is Model

import Foundation
import SwiftUI


struct MemoryGame<CardContent> where CardContent: Equatable {

    private(set) var cards: Array<Card>

    private var indexOfTheOneAndOnlyFaceUpCard: Int?

    mutating func choose(_ card: Card) {

        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for  index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }

        print("\(cards)")

    }
    
    var theme: GameTheme

    init(theme: GameTheme, numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        self.theme = theme
        cards = Array<Card>()
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }

    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}

struct GameTheme {
    var color: Color
}

struct ThemeButton: View {
    var theme: String
    var color: Color
    var systemName: String
    var numberOfPairs: Int
    var cardColor: Color
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Button(action: {
            viewModel.model = EmojiMemoryGame.newGame(theme: theme, numberOfPairs: numberOfPairs, cardColor: cardColor)
        }, label: {
            Image(systemName: systemName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .font(.largeTitle)
                .foregroundColor(cardColor)
        })
        
    }
}




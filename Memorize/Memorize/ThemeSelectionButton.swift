//
//  ThemeSelectionButton.swift
//  Memorize
//
//  Created by Максим Митрофанов on 23.08.2023.
//

import SwiftUI

struct ThemeSelectionButton: View {
    let theme: GameTheme
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Button {
            // TODO: -- refactor the below code, se the newGame() method takes only the game theme and nothing else
            // Expected result: viewModel.model = EmojiMemoryGame.newGame(theme: theme)
            viewModel.model = EmojiMemoryGame.newGame(themeName: theme.name, numberOfPairs: theme.numberOfPairsOfCards, cardColor: theme.cardColor)
        } label: {
            Image(systemName: theme.symbolName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .font(.largeTitle)
                .foregroundColor(theme.cardColor)
        }
    }
}

struct ThemeSelectionButton_Previews: PreviewProvider {
    static let carsTheme   =  GameTheme(name: "cars", numberOfPairsOfCards: 4, cardColor: .red, symbolName: "car.circle")
    static let planesTheme =  GameTheme(name: "planes", numberOfPairsOfCards: 6, cardColor: .orange, symbolName: "airplane.circle")
    static let shipsTheme  =  GameTheme(name: "ships", numberOfPairsOfCards: 8, cardColor: .blue, symbolName: "sailboat.circle")
    static let fruitsTheme =  GameTheme(name: "fruits", numberOfPairsOfCards: 10, cardColor: .green, symbolName: "leaf.circle")
    
    static var previews: some View {
        HStack {
            ThemeSelectionButton(theme: carsTheme, viewModel: EmojiMemoryGame())
            ThemeSelectionButton(theme: planesTheme, viewModel: EmojiMemoryGame())
            ThemeSelectionButton(theme: shipsTheme, viewModel: EmojiMemoryGame())
            ThemeSelectionButton(theme: fruitsTheme, viewModel: EmojiMemoryGame())
        }
        .padding(.horizontal)
        .padding(.horizontal)
    }
}

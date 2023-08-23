//
//  ContentView.swift
//  Memorize
//
//  Created by Котенок Майнкун on 10.07.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            cardsScrollView
                .padding(.top, 80)
            Spacer()
            themeSelectionView
        }
        .padding()
        .background {
            Image("Generic_Animal")
                .resizable()
                .scaledToFill()
        }
        .edgesIgnoringSafeArea(.vertical)
    }

    private var cardsScrollView: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
                .foregroundColor(.orange) 
            }
        }
    }
    
    private var themeSelectionView: some View {
        VStack {
            Text("Choose theme to play")
                .font(.title)
                .bold()
            
            HStack {
                ThemeSelectionButton(theme: GameTheme(name: "cars", numberOfPairsOfCards: 4, cardColor: .red, symbolName: "car.circle"), viewModel: viewModel)
                ThemeSelectionButton(theme: GameTheme(name: "ships", numberOfPairsOfCards: 6, cardColor: .blue, symbolName: "sailboat.circle"), viewModel: viewModel)
                ThemeSelectionButton(theme: GameTheme(name: "planes", numberOfPairsOfCards: 8, cardColor: .orange, symbolName: "airplane.circle"), viewModel: viewModel)
                ThemeSelectionButton(theme: GameTheme(name: "animals", numberOfPairsOfCards: 6, cardColor: .green, symbolName: "pawprint.circle"), viewModel: viewModel)
//                ThemeSelectionButton(theme: "reptiles", buttonColor: .mint, systemName: "sun.max.circle", numberOfPairs: 6, cardColor: .mint, viewModel: viewModel)
//                ThemeSelectionButton(theme: "fishes", buttonColor: .blue, systemName: "fish.circle", numberOfPairs: 8, cardColor: .blue, viewModel: viewModel)
//                ThemeSelectionButton(theme: "moon", buttonColor: .purple, systemName: "moon.circle", numberOfPairs: 4, cardColor: .purple, viewModel: viewModel)
            }
            .padding(.horizontal)
        }
        .padding()
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 20))
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    let shape = RoundedRectangle(cornerRadius: 10)

    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                ZStack {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                }
                .shadow(radius: 10)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill().foregroundColor(card.cardColor)
                    .shadow(color: .gray.opacity(0.5), radius: 4, x: 2, y: 2)
            }
        }
        .padding(2)
        .foregroundColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}


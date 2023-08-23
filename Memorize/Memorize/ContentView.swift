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
                ThemeCards(theme: "cars", buttonColor: .red, systemName: "car.circle", numberOfPairs: 4, cardColor: .red, viewModel: viewModel)
                ThemeCards(theme: "planes", buttonColor: .orange, systemName: "airplane.circle", numberOfPairs: 6, cardColor: .orange, viewModel: viewModel)
                ThemeCards(theme: "ships", buttonColor: .yellow, systemName: "sailboat.circle", numberOfPairs: 8, cardColor: .yellow, viewModel: viewModel)
                ThemeCards(theme: "animals", buttonColor: .green, systemName: "pawprint.circle", numberOfPairs: 4, cardColor: .green, viewModel: viewModel)
                ThemeCards(theme: "reptiles", buttonColor: .mint, systemName: "sun.max.circle", numberOfPairs: 6, cardColor: .mint, viewModel: viewModel)
                ThemeCards(theme: "fishes", buttonColor: .blue, systemName: "fish.circle", numberOfPairs: 8, cardColor: .blue, viewModel: viewModel)
                ThemeCards(theme: "moon", buttonColor: .purple, systemName: "moon.circle", numberOfPairs: 4, cardColor: .purple, viewModel: viewModel)
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


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

        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
                .foregroundColor(.red)
                Spacer(minLength: 50)
            }

            Text("Choose theme to play:")

            HStack {

                ThemeButton(theme: "cars", color: .red, systemName: "car.circle", numberOfPairs: 8, cardColor: .red, viewModel: viewModel)
                ThemeButton(theme: "planes", color: .orange, systemName: "airplane.circle", numberOfPairs: 8, cardColor: .orange, viewModel: viewModel)
                ThemeButton(theme: "ships", color: .yellow, systemName: "sailboat.circle", numberOfPairs: 8, cardColor: .yellow, viewModel: viewModel)
                ThemeButton(theme: "animals", color: .green, systemName: "pawprint.circle", numberOfPairs: 8, cardColor: .green, viewModel: viewModel)
                ThemeButton(theme: "reptiles", color: .blue, systemName: "sun.max.circle", numberOfPairs: 8, cardColor: .blue, viewModel: viewModel)
                ThemeButton(theme: "fishes", color: .blue, systemName: "fish.circle", numberOfPairs: 8, cardColor: .blue, viewModel: viewModel)
                ThemeButton(theme: "moon", color: .purple, systemName: "moon.circle", numberOfPairs: 8, cardColor: .purple, viewModel: viewModel)

            }

        }

        .padding()

    }
}

struct CardView: View {

    let card: MemoryGame<String>.Card

    var body: some View {

        ZStack {

            let shape = RoundedRectangle(cornerRadius: 20)

            if card.isFaceUp {

                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)

            } else {

                shape.fill()

            }
        }

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


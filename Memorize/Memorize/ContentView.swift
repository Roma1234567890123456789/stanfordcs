import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame

    var body: some View {
        VStack {
            cardsScrollView
                .padding(.top, 80)
            Spacer()
            themeSelectionView
        }
        .padding()
        .background(
            Image("Generic_Animal")
                .resizable()
                .scaledToFill()
        )
        .edgesIgnoringSafeArea(.vertical)
    }
    
    private var cardsScrollView: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card, theme: viewModel.selectedTheme)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
          
            
            Spacer(minLength: 50)
        }
    }
    
    private var themeSelectionView: some View {
        VStack {
            Text("Choose theme to play")
                .font(.title)
                .bold()
                .padding(.top)
            
            HStack {
                ForEach(viewModel.themeOptions, id: \.name) { theme in
                    // ThemeSelectionButton()
                }
            }
            .padding(.horizontal)
        }
        .padding()
        .background(
            Color(.systemBackground)
                .opacity(0.9)
                .cornerRadius(20)
        )
    }
    
    struct CardView: View {
        var card: MemoryGame<String>.Card
        var theme: GameTheme
 
        
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(card.isFaceUp ? Color.white : Color.gray)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: card.isFaceUp ? 3 : 0)
                    .foregroundColor(theme.cardColor)
                
                Text(card.content)
                    .font(.system(size: 40))
                    .foregroundColor(card.isFaceUp ? Color.black : Color.white)
                    .padding()
            }
            .aspectRatio(2/3, contentMode: .fit)
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(viewModel: EmojiMemoryGame())
        }
    }
}


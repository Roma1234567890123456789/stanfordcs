import SwiftUI

struct ThemeSelectionButton: View {
    let theme: GameTheme
    @ObservedObject var viewModel: EmojiMemoryGame
    @Binding var cardColor: Color
    
    var body: some View {
        VStack {
            standardButton
            customButton
        }
    }
    
    var customButton: some View {
        CustomButton {
       //     viewModel.newGame(theme: theme.name)
        } label: {
            Image(systemName: theme.symbolName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .font(.largeTitle)
                .foregroundColor(theme.cardColor)
        }

    }
    
    var standardButton: some View {
        Button {
          //  viewModel.newGame(theme: theme.name)
            
        } label: {
            Image(systemName: theme.symbolName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .font(.largeTitle)
                .foregroundColor(theme.cardColor)
        }
    }
}


struct CustomButton<LabelType: View>: View {
    
    var action: () -> ()
    var label: () -> LabelType
    
    var body: some View {
        label().onTapGesture {
            action()
        }
    }
}

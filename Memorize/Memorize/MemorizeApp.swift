import SwiftUI

@main
struct MemorizeApp: App {
    
    
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            ContentView(viewModel: game)
                .preferredColorScheme(.light) 
        }
    }
}




//
//  GameTheme.swift
//  Memorize
//
//  Created by Максим Митрофанов on 23.08.2023.
//

import SwiftUI
import Foundation

struct GameTheme {
    let name: String
    let numberOfPairsOfCards: Int
    let cardColor: Color
    let symbolName: String
    
    // TODO: Game Theme struct (game theme model) should store the emojis array
    var emojis: [String] = []
    
    func getSymbolName() -> String {
        return "heart.fill"
    }
}

//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Edwin George on 9/22/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    // these are called type variables and type functions
    // they are attributes on the EmojiMemoryGame class itself, not on the instances of the class
    // they're basically global as well, you can access them using EmojiMemoryGame.emojis
    static let emojis = ["🚂","🛺", "🚁", "🚤", "✈️", "🛸", "🚀", "🏍", "🚜","⛴","🛩","🛰","🛵","🚲","🚑"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numPairsOfCards: 4) { pairIndex in emojis[pairIndex] }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
        
    
    // this is an example of a closure. to access cards, you must type cards()
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

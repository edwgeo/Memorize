//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Edwin George on 9/22/22.
//

import SwiftUI

class EmojiMemoryGame {
    private var model: MemoryGame<String> = MemoryGame<String>{}
    
    // this is an example of a closure. to access cards, you must type cards()
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}

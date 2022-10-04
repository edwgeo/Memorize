//
//  MemoryGame.swift
//  Memorize
//
//  Created by Edwin George on 9/22/22.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
//        print("chosen Card is \(cards[chosenIndex])")
//        print(cards)
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0 // not found
    }
    
    // without init, you cannot initialize a MemoryGame struct from within a class such as EmojiMemoryGame
    // this is because while structs can have variables that aren't initialized with values (such as cards), classes cannot.
    init(numPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add # of pairs of cards x 2 cards to cards array
        for pairIndex in 0..<numPairsOfCards {
            // call func to obtain a card based on type of game being played
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}

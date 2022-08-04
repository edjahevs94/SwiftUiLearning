//
//  EmojiMemoryGame.swift
//  SwiftUiLearningProject
//
//  Created by EdgardVS on 4/08/22.
//ESTE ES EL VIEW MODEL

import SwiftUI



class EmojiMemoryGame {
    
    static var emojis: Array<String> = ["🚂","🚀","🚁","🛸", "🚌", "🚛", "🛶", "🛳", "⛵️", "🚃", "🛺"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: 3) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
            
        }
    }
    
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}


//
//  Concentration.swift
//  Concentration
//
//  Created by Berk Batuhan ŞAKAR on 19.10.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    var score = 0
    var flipCount = 0
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
          cards[index].isFaceUP = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else {
                //either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUP = false
                }
                cards[index].isFaceUP = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        flipCount += 1
        //cards[index].isFaceUP = !cards[index].isFaceUP
        
    }
    
    init(numberOfPairsOfCards: Int) {
        var unShuffleCards: [Card] = []
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
//            cards += [card, card]
            unShuffleCards += [card, card]
        }
        
        //TODO: Shuffle the cards - Kartları karıştır.
//        cards.shuffle()
        while !unShuffleCards.isEmpty {
            let randomIndex = unShuffleCards.count.arc4Random
            let card = unShuffleCards.remove(at: randomIndex)
            cards.append(card)
        }
    }
}


extension Int {
    var arc4Random: Int {
        switch self {
        case 1...Int.max:
            return Int(arc4random_uniform(UInt32(self)))
        case -Int.max..<0:
            return Int(arc4random_uniform(UInt32(self)))
        default:
            return 0
        }
    }
}

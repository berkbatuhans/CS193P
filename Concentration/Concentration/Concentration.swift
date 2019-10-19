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
    
    func chooseCard(at index: Int) {
        //v1
        //        if cards[index].isFaceUP {
        //            cards[index].isFaceUP = false
        //        } else {
        //            cards[index].isFaceUP = true
        //        }
        
        //v2
        cards[index].isFaceUP = !cards[index].isFaceUP
        
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        //TODO: Shuffle the cards - Kartları karıştır.
        
    }
}

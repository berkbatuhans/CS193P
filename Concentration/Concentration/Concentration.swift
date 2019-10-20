//
//  Concentration.swift
//  Concentration
//
//  Created by Berk Batuhan ŞAKAR on 19.10.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import Foundation

class Concentration {
    
    //MARK: Public types
    var score: Int
    var flips: Int
    
    // MARK: - Semipublic types
    private(set) var cards: [Card]
    
    // MARK: - Private types
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUP {
                    guard foundIndex == nil else {
                        return nil
                    }
                    foundIndex = index
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUP = (index == newValue)
            }
        }
    }
    
    //MARK: - Init
    
    init(numberOfPairsOfCards: Int) {
        score = Int.zero
        flips = Int.zero
        cards = [Card]()
        
        //        var unShuffleCards: [Card] = []
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
            //            unShuffleCards += [card, card]
        }
        
        //TODO: Shuffle the cards - Kartları karıştır.
        cards.shuffle()
        //        while !unShuffleCards.isEmpty {
        //            let randomIndex = unShuffleCards.count.arc4Random
        //            let card = unShuffleCards.remove(at: randomIndex)
        //            cards.append(card)
        //        }
    }
    
    
    func chooseCard(at index: Int) {
        
        assert(cards.indices.contains(index), "Concentration.chooseCard (at: \(index)): Dizini aralık dışında seçti")
        
        if !cards[index].isMatched, !cards[index].isFaceUP {
            
            // One card selected
            if let selectedCardIndex = indexOfOneAndOnlyFaceUpCard, selectedCardIndex != index {
                //Matching card found
                matchCards(at: selectedCardIndex, at: index)
                cards[index].isFaceUP = true
                //Two or none cards selected
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        flips += 1
        
        
    }
    
    //MARK: - Private methods
    
    private func matchCards(at firstIndex: Int, at secondIndex: Int){
        //check if cards match
        if cards[firstIndex].identifier == cards[secondIndex].identifier {
            cards[firstIndex].isMatched = true
            cards[secondIndex].isMatched = true
            addReward()
        } else {
            
            //Kart daha önce görüntülendi ise ceza ver. ilk defa görüntülendiğinde ceza puanı yazma.
            if cards[secondIndex].isSeen {
                addPenalty()
                //                score -= Concentration.wasFaceUpPenalty
            }
        }
        
    }
    
    private func addReward(){
        addScore(of: GameRules.reward)
    }
    
    private func addPenalty() {
        addScore(of: GameRules.penalty)
    }
    
    private func addScore(of value: Int){
        score += value
    }
}




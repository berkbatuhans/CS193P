//
//  Card.swift
//  Concentration
//
//  Created by Berk Batuhan ŞAKAR on 19.10.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import Foundation

struct Card {
    // Kart'ın Ön/Arka yüzümü tutan parametre
    var isFaceUP = false {
        didSet {
            if isFaceUP { isSeen = true }
        }
    }
    // Kart'ın eşleşip eşleşmediğini tutan parametre
    var isMatched = false
    // Kartın açıldığını tutan parametre
    var isSeen = false
    var identifier: Int
    
    //self parametresi kullanmadan struct içinde init yazma.
//    init(identifier i: Int) {
//        identifier = i
//    }
    
//    init(identifier: Int) {
//        self.identifier = identifier
//    }
    static var identifierFactory = 0
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}

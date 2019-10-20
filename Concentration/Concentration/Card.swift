//
//  Card.swift
//  Concentration
//
//  Created by Berk Batuhan ŞAKAR on 19.10.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import Foundation

struct Card {
    // MARK: - Public types
    
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
    
    //MARK: - Semipublic types
    
    private(set) var identifier: Int
    
    // MARK: Private types
    static var identifierFactory = 0
    
    
    // MARK: - Init
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    // MARK: - Private methods:
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
}

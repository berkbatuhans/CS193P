//
//  Int+Numbers.swift
//  Concentration
//
//  Created by Berk Batuhan ŞAKAR on 20.10.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import Foundation


extension Int {
    
    static var zero: Int {
        return 0
    }
    
    var arc4Random: Int {
        if self > 0 {
            return Int.random(in: 0..<self)
        } else if self < 0 {
            return -Int.random(in: 0..<abs(self))
        } else {
            return 0
        }
        
    }
    
}

//extension Int {
//    var arc4Random: Int {
//        switch self {
//        case 1...Int.max:
//            return Int(arc4random_uniform(UInt32(self)))
//        case -Int.max..<0:
//            return Int(arc4random_uniform(UInt32(self)))
//        default:
//            return 0
//        }
//    }
//}

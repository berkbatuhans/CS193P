//
//  Themes.swift
//  Concentration
//
//  Created by Berk Batuhan ŞAKAR on 20.10.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import Foundation
import UIKit

struct Theme {
    //MARK: Public types
    var emojiSet: [String]
    var backgroundColor: UIColor
    var cardColor: UIColor
    
    //MARK: Private types
    
    private static var themes: [Theme] {
        return [
            Theme(emojiSet: ["🏀","🏈","⚾️","🎾","🏐","🏉","🎱","⚽️","🏓","🏸"], backgroundColor: #colorLiteral(red: 0.4549019608, green: 0.9019607843, blue: 0, alpha: 1) , cardColor: #colorLiteral(red: 0.8745098039, green: 0, blue: 0.3098039216, alpha: 1)),
            Theme(emojiSet: ["😀","😃","😄","😁","😆","😅","😂","🤣","☺️","😇"], backgroundColor: #colorLiteral(red: 1, green: 0.2862745098, blue: 0, alpha: 1), cardColor: #colorLiteral(red: 0, green: 0.6862745098, blue: 0.3921568627, alpha: 1)),
            Theme(emojiSet: ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯"], backgroundColor: #colorLiteral(red: 1, green: 0.9098039216, blue: 0, alpha: 1), cardColor: #colorLiteral(red: 0.3254901961, green: 0.05882352941, blue: 0.6784313725, alpha: 1)),
            Theme(emojiSet: ["🍏","🍎","🍒","🍆","🍑","🍌","🍉","🌶","🥦","🍇"], backgroundColor: UIColor.purple, cardColor:UIColor.yellow),
            Theme(emojiSet: ["🍗","🍣","🍜","🍝","🍕","🍔","🍤","🥟","🌮","🍟"], backgroundColor: UIColor.green, cardColor:UIColor.red),
            Theme(emojiSet: ["🎤","🎧","🎼","🎹","🥁","🎮","🎷","🎺","🎸","🥁"], backgroundColor: UIColor.magenta, cardColor:UIColor.white),
            Theme(emojiSet: ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐"], backgroundColor: UIColor.black, cardColor:UIColor.magenta)
        ]
    }
    
    //MARK: - Public methods
    static func randomTheme() -> Theme {
        let count = themes.count
        return themes[Int.random(in: 0..<count)]
    }
}


//
//// Tema Eklenmesi
//typealias ThemeData = (emoji: [String], backGroundColor: UIColor, cardBackColor: UIColor)
//private let themedata: [String: ThemeData] = [
//    "people":  (["👩", "👮🏻‍♂️", "👩‍💻", "👨🏾‍🌾", "🧟‍♀️", "👩🏽‍🎨", "👩🏼‍🍳", "🧕🏼", "💆‍♂️", "🤷🏽‍♂️"], #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)),
//    "animals": (["🐶", "🙊", "🐧", "🦁", "🐆", "🐄", "🐿", "🐠", "🦆", "🦉"], #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)),
//    "faces":  (["😀", "🤪", "😬", "😭", "😎", "😍", "🤠", "😇", "🤩", "🤢"], #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)),
//    "fruits": (["🍏", "🥑", "🍇", "🍒", "🍑", "🥝", "🍐", "🍎", "🍉", "🍌"], #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)),
//    "transport": (["🚗", "🚓", "🚚", "🏍", "✈️", "🚜", "🚎", "🚲", "🚂", "🛴"], #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)),
//    "sports": (["🏊🏽‍♀️", "🤽🏻‍♀️", "t🤾🏾‍♂️", "⛹🏼‍♂️", "🏄🏻‍♀️", "🚴🏻‍♀️", "🚣🏿‍♀️", "⛷", "🏋🏿‍♀️", "🤸🏼‍♂️"], #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1), #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)),
//    "hellowen": (["🦇","😱","🙀","😈","🎃","👻","🍭","🍬","🍎"],#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1),#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
//]
//
//private var newTheme: ThemeData {
//    let randomIndex = themedata.count.arc4Random
//    let key = Array(themedata.keys)[randomIndex]
//    return themedata[key]!
//}
//
//
//// Tema Bitiş


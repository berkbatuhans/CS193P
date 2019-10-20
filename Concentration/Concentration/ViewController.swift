//
//  ViewController.swift
//  Concentration
//
//  Created by Berk Batuhan ŞAKAR on 19.10.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game: Concentration!
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet weak var gameScoreLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    
    // Tema Eklenmesi
    typealias ThemeData = (emoji: [String], backGroundColor: UIColor, cardBackColor: UIColor)
    private let themedata: [String: ThemeData] = [
        "people":  (["👩", "👮🏻‍♂️", "👩‍💻", "👨🏾‍🌾", "🧟‍♀️", "👩🏽‍🎨", "👩🏼‍🍳", "🧕🏼", "💆‍♂️", "🤷🏽‍♂️"], #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)),
        "animals": (["🐶", "🙊", "🐧", "🦁", "🐆", "🐄", "🐿", "🐠", "🦆", "🦉"], #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)),
        "faces":  (["😀", "🤪", "😬", "😭", "😎", "😍", "🤠", "😇", "🤩", "🤢"], #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)),
        "fruits": (["🍏", "🥑", "🍇", "🍒", "🍑", "🥝", "🍐", "🍎", "🍉", "🍌"], #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)),
        "transport": (["🚗", "🚓", "🚚", "🏍", "✈️", "🚜", "🚎", "🚲", "🚂", "🛴"], #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)),
        "sports": (["🏊🏽‍♀️", "🤽🏻‍♀️", "t🤾🏾‍♂️", "⛹🏼‍♂️", "🏄🏻‍♀️", "🚴🏻‍♀️", "🚣🏿‍♀️", "⛷", "🏋🏿‍♀️", "🤸🏼‍♂️"], #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1), #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)),
        "hellowen": (["🦇","😱","🙀","😈","🎃","👻","🍭","🍬","🍎"],#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1),#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    ]
    
    private var newTheme: ThemeData {
        let randomIndex = themedata.count.arc4Random
        let key = Array(themedata.keys)[randomIndex]
        return themedata[key]!
    }
    
    private var theme: ThemeData! {
        didSet{
            view.backgroundColor = theme.backGroundColor
            cardButtons.forEach{
                $0.backgroundColor = theme.cardBackColor
                $0.setTitle("", for: .normal)
            }
            flipCountLabel.textColor = theme.cardBackColor
            gameScoreLabel.textColor = theme.cardBackColor
        }
    }
    // Tema Bitiş
    
    
    @IBOutlet weak var newGameButton: UIButton! {
        didSet{
            newGameButton.titleLabel?.numberOfLines = 0
        }
    }
    
    
    @IBAction func onNewGame(_ sender: UIButton, forEvent event: UIEvent) {
        startNewGame()
    }
    
    private func startNewGame(){
        theme = newTheme
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        flipCountLabel.text = "Çevirme: \(game.flipCount)"
        gameScoreLabel.text = "Puan: \(game.score)"
        emoji = [:]
        emojiChoices = theme.emoji
    }
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            flipCountLabel.text = "Çevirmeler: \(game.flipCount)"
            gameScoreLabel.text = "Puan: \(game.score)"
        } else {
            print("seçilen kart bağlı değildi")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUP {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : theme.cardBackColor
            }
        }
    }
    
    private lazy var emojiChoices: [String] = {
        return theme.emoji
    }()
    var emoji =  [Int:String]()
    func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count - 1)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        //v1
        //        if emoji[card.identifier] != nil {
        //            return emoji[card.identifier]!
        //        }else {
        //            return "?"
        //        }
        
        //v2 refactoring
        return emoji[card.identifier] ?? "?"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
}


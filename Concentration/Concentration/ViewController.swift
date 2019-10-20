//
//  ViewController.swift
//  Concentration
//
//  Created by Berk Batuhan ŞAKAR on 19.10.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    var game: Concentration!
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet weak var gameScoreLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var newGameButton: UIButton! {
        didSet{
            newGameButton.titleLabel?.numberOfLines = 0
        }
    }
    
    
    @IBAction func onNewGame(_ sender: UIButton, forEvent event: UIEvent) {
        startNewGame()
    }
    
    private func startNewGame(){
//        theme = newTheme
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        flipCountLabel.text = "Flips: \(game.flipCount)"
        gameScoreLabel.text = "Score: \(game.score)"
        emoji = [:]
//        emojiChoices = theme.emoji
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
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🦇","😱","🙀","😈","🎃","👻","🍭","🍬","🍎"]
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


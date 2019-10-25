//
//  ViewController.swift
//  Concentration
//
//  Created by Berk Batuhan ŞAKAR on 19.10.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Private types
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    private var theme: Theme = Theme.randomTheme() {
        didSet{
            emojiSet = theme.emojiSet
            view.backgroundColor = theme.backgroundColor
            cardButtons.forEach{
                $0.backgroundColor = theme.cardColor
                $0.setTitle("", for: .normal)
            }
            flipCountLabel.textColor = theme.cardColor
            gameScoreLabel.textColor = theme.cardColor
            newGameButton.setTitleColor(theme.cardColor, for: UIControl.State.normal)
        }
    }
    
    private lazy var emojiSet: [String] = theme.emojiSet
    private lazy var emoji =  [Card:String]()
    private var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    
    @IBOutlet private weak var flipCountLabel: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
    @IBOutlet private weak var gameScoreLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var newGameButton: UIButton! {
        didSet{
            newGameButton.titleLabel?.numberOfLines = 0
        }
    }
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Private action methods
    
    @IBAction private func touchCard(_ sender: UIButton) {
        
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            sender.isEnabled = false
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("seçilen kart bağlı değildi")
        }
    }
    
    @IBAction private func onNewGame(_ sender: UIButton, forEvent event: UIEvent) {
        startNewGame()
    }
    
    
    
    // MARK: - Private methods
    
    private func startNewGame(){
        game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
        theme = Theme.randomTheme()
        emoji = [:]
        updateViewFromModel()
    }
    
    
    private func emoji(for card: Card) -> String {
        
        if emoji[card] == nil, emojiSet.count > 0 {
//            let randomIndex = Int.random(in: 0..<emojiSet.count)
//            emoji[card] = emojiSet.remove(at: randomIndex)
            emoji[card] = emojiSet.remove(at: emojiSet.count.arc4Random)
        }
        
        //v1
        //        if emoji[card.identifier] != nil {
        //            return emoji[card.identifier]!
        //        }else {
        //            return "?"
        //        }
        
        //v2 refactoring
        return emoji[card] ?? "?"
    }
    private func updateViewFromModel() {
        
        var hasCardsNotMathed = false
        
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUP {
                button.isEnabled = false
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.isEnabled = true
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? theme.backgroundColor : theme.cardColor
            }
            
            if !card.isMatched {
                hasCardsNotMathed = true
            }
        }
        
        
        updateFlipCountLabel()
        gameScoreLabel.text = "Puan: \(game.score)"
        
        if !hasCardsNotMathed {
            launchEndGameAlert()
        }
    }
    
    private func updateFlipCountLabel(){
        let attributes: [NSAttributedString.Key:Any] = [
            .strokeWidth: 5.0,
            .strokeColor: #colorLiteral(red: 0.9768255353, green: 0.5174402595, blue: 0.08832768351, alpha: 1)
        ]
        let attributedString = NSAttributedString(string: "Çevirme: \(game.flips)", attributes: attributes)
        flipCountLabel.attributedText = attributedString
    }
    
    private func launchEndGameAlert() {
        let alert = UIAlertController(title: "Oyun Bitti", message: gameScoreLabel.text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yeni Oyun", style: .default, handler: { _ in
            self.startNewGame()
        }))
        self.present(alert, animated: true)
    }
    
    
    
    
    
    
    
    
    
    
}


//
//  ViewController.swift
//  tic tac toe
//
//  Created by Kadir Kutluhan Alev on 21.08.2018.
//  Copyright © 2018 Kadir Kutluhan Alev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // 1 is noughts , 2 is crosses
    
    @IBAction func playAgain(_ sender: Any) {
        activeGame = true
        activePlayer = 1
        gameState = [0,0,0,0,0,0,0,0,0]
        
        for i in 1..<10{
            if let button = view.viewWithTag(i) as? UIButton {
                
                button.setImage(nil, for: [])
            }
        }
    }
    @IBOutlet var playAgainButton: UIButton!
    var activeGame = true 
    
    @IBOutlet var winnerLabel: UILabel!
    var activePlayer = 1
    var gameState = [0,0,0,0,0,0,0,0,0] // 0 - empty , 1- noughts , 2-crosses
    
    let winningCombination = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0  && activeGame{
            gameState[activePosition] == activePlayer
            if activePlayer == 1 {
                sender.setImage(UIImage(named:"nought.png"),for:[])
                activePlayer = 2
                
            }else {
                sender.setImage(UIImage(named:"cross.png"), for: [])
                activePlayer = 1
            }
            
            for combination in winningCombination {
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    // we have a winner !
                    activeGame = false
                    winnerLabel.isHidden = false
                    playAgainButton.isHidden = false
                    if gameState[combination[0]] == 1{
                        winnerLabel.text = "Noughts has won!"
                    }else {
                        winnerLabel.text = "Crosses has won!"
                    }
                    UIView.animate(withDuration: 1, animations: {
                            self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x+500, y: self.winnerLabel.center.y)
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x+500, y: self.playAgainButton.center.y)
                    })
                }
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        winnerLabel.center  = CGPoint(x: winnerLabel.center.x-500, y: winnerLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x-500, y: playAgainButton.center.y)
    }


}


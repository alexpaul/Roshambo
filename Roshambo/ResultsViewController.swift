//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Alex Paul on 6/13/15.
//  Copyright (c) 2015 Alex Paul. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImageView: UIImageView!
    
    // Array with All 3 Playing Options 
    // This array will be used to play a random hand for the Computer
    let rockPaperScissors = ["Rock", "Paper", "Scissors"]
    
    var userPlayed: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let valueFromUser = userPlayed{
            // Compare user vs computer to see who won
            findResultOfRockPaperScissors()
        }else{
            // No Value was Found
        }
    }
    
    @IBAction func playAgainButtonPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func findResultOfRockPaperScissors(){
        // Generate a random hand for the computer's turn 
        let randomNumber = Int(arc4random_uniform(3))
        
        let computerPlayed = rockPaperScissors[randomNumber]
        
        if userPlayed == computerPlayed {
            // Tie Game
            self.resultLabel.text = "We got a Tie. You both choose \(userPlayed)"
            self.resultImageView.image = UIImage(named: "tie_game")
            return
        }else {
            switch userPlayed {
            case "Rock":
                if computerPlayed == "Scissors" {
                    self.resultLabel.text = "Player Wins! \(userPlayed) wins against \(computerPlayed)"
                    self.resultImageView.image = UIImage(named: "RockCrushesScissors")
                }else{
                    // Computer Wins
                    computerWins(computerPlayed)
                }
            case "Paper":
                if computerPlayed == "Rock" {
                    self.resultLabel.text = "Player Wins! \(userPlayed) wins against \(computerPlayed)"
                    self.resultImageView.image = UIImage(named: "PaperCoversRock")
                }else{
                    // Computer Wins
                    computerWins(computerPlayed)
                }
            case "Scissors":
                if computerPlayed == "Paper" {
                    self.resultLabel.text = "Player Wins! \(userPlayed) wins agaist \(computerPlayed)"
                    self.resultImageView.image = UIImage(named: "ScissorsCutPaper")
                }else{
                    // Computer Wins
                    computerWins(computerPlayed)
                }
            default:
                println("Invalid Play")
            }
        }
    }
    
    func computerWins(computerPlayed: String) {
        // Computer Wins
        self.resultLabel.text = computerPlayed + " wins against your " + userPlayed
        self.resultImageView.image = UIImage(named: "you_lose")
    }

}

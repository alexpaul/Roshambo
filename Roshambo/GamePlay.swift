//
//  GamePlay.swift
//  Roshambo
//
//  Created by Alex Paul on 6/21/15.
//  Copyright (c) 2015 Alex Paul. All rights reserved.
//
//  Get a result of a Game Play between the User and Computer

import UIKit

class GamePlay: NSObject {
    
    // Array with All 3 Playing Options
    // This array will be used to play a random hand for the Computer
    let rockPaperScissors = ["Rock", "Paper", "Scissors"]
    
    //var userPlayed: String!
    var result: Result!
    
    
    func resultOfRockPaperScissorsGame(userPlayed: String) -> Result?{
        // Generate a random hand for the computer's turn
        let randomNumber = Int(arc4random_uniform(3))
        
        let computerPlayed = rockPaperScissors[randomNumber]
        
        self.result = Result(resultString: "", resultImage: UIImage(named: "tie_game")!)
        
        if userPlayed == computerPlayed {
            // Tie Game
            self.result.resultString = "We got a Tie. You both choose \(userPlayed)"
            self.result.resultImage = UIImage(named: "tie_game")
            self.result.winLoseTie = "Tie"
            return self.result
        }else {
            switch userPlayed {
            case "Rock":
                if computerPlayed == "Scissors" {
                    self.result.resultString = "Player Wins! \(userPlayed) wins against \(computerPlayed)"
                    self.result.resultImage = UIImage(named: "RockCrushesScissors")
                    self.result.winLoseTie = "Win"
                }else{
                    // Computer Wins
                    self.result = computerWins(computerPlayed, userPlayed: userPlayed)
                }
            case "Paper":
                if computerPlayed == "Rock" {
                    self.result.resultString = "Player Wins! \(userPlayed) wins against \(computerPlayed)"
                    self.result.resultImage = UIImage(named: "PaperCoversRock")
                    self.result.winLoseTie = "Win"
                }else{
                    // Computer Wins
                    self.result = computerWins(computerPlayed, userPlayed: userPlayed)
                }
            case "Scissors":
                if computerPlayed == "Paper" {
                    self.result.resultString = "Player Wins! \(userPlayed) wins agaist \(computerPlayed)"
                    self.result.resultImage = UIImage(named: "ScissorsCutPaper")
                    self.result.winLoseTie = "Win"
                }else{
                    // Computer Wins
                    self.result = computerWins(computerPlayed, userPlayed: userPlayed)
                }
            default:
                println("Invalid Play")
            }
        }
        
        return self.result
    }
    
    func computerWins(computerPlayed: String, userPlayed: String) -> Result? {
        self.result = Result(resultString: "", resultImage: UIImage(named: "tie_game")!)
        
        // Computer Wins
        self.result.resultString = computerPlayed + " wins against your " + userPlayed
        self.result.resultImage = UIImage(named: "you_lose")
        self.result.winLoseTie = "Lose"
        
        return self.result
    }

}

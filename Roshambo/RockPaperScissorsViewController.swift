//
//  RockPaperScissorsViewController.swift
//  Roshambo
//
//  Created by Alex Paul on 6/13/15.
//  Copyright (c) 2015 Alex Paul. All rights reserved.
//

import UIKit

class RockPaperScissorsViewController: UIViewController {
    
    enum userOptions: String{
        case Rock = "Rock"
        case Paper = "Paper"
        case Scissors = "Scissors"
    }
    
    var userPlayed: String!
    var gamePlay: GamePlay!
    var resultsVC: ResultsViewController!
    var historyVC: HistoryViewController!
    var history = [Result]() // array of results
    
    @IBAction func playButtonPressed(sender: UIButton) {
        
        switch sender.tag {
           case 1: segueOnlyInCode(userOptions.Rock.rawValue) // Rock's Segue is all done ONLY in code
           case 2: segueInCodeAndStoryborad(userOptions.Paper.rawValue) // Paper's Segue is done using Code and Storyboard
           // Scissors's Segue is done ONLY with Storyboard
           default: println("Not a Valid Play button")
        }
    }
    
    // Uncomment this code if you want to use Storyboard to Present the Results View Controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "paperPlayed"{
            resultsVC = segue.destinationViewController as! ResultsViewController
            setupResultsViewController()
        }else if segue.identifier == "scissorsPlayed" { // Segue ONLY using Storyboard
            self.userPlayed = userOptions.Scissors.rawValue
            resultsVC = segue.destinationViewController as! ResultsViewController
            setupResultsViewController()
        }
    }
    
    @IBAction func historyButtonPressed(sender: UIButton) {
        historyVC = self.storyboard?.instantiateViewControllerWithIdentifier("HistoryViewController") as! HistoryViewController
        historyVC.history = self.history
        self.presentViewController(historyVC, animated: true, completion: nil)
    }
    
    func segueOnlyInCode(userPlayed: String){
        resultsVC = self.storyboard?.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
        
        gamePlay = GamePlay() // instance of GamePlay
        
        // Play a Game
        if let result = gamePlay.resultOfRockPaperScissorsGame(userPlayed){
            history.append(result) // add the result to history array
            resultsVC.result = result // pass the result to History View Controller
        }
        
        self.presentViewController(resultsVC, animated: true, completion: nil)
    }
    
    func segueInCodeAndStoryborad(userPlayed: String){
        self.userPlayed = userPlayed
        self.performSegueWithIdentifier("paperPlayed", sender: self)
    }
    
    func setupResultsViewController(){
        gamePlay = GamePlay() // instance of GamePlay
        
        // Play a Game
        if let result = gamePlay.resultOfRockPaperScissorsGame(self.userPlayed){
            history.append(result) // add the result to history array
            resultsVC.result = result // pass the result to History View Controller
        }
    }
    

}

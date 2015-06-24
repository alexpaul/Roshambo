//
//  RockPaperScissorsViewController.swift
//  Roshambo
//
//  Created by Alex Paul on 6/13/15.
//  Copyright (c) 2015 Alex Paul. All rights reserved.
//
//  Rock, Paper, Scissors Game. User vs. Computer

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
        if sender.tag == 2 { // Paper was choosen
            segueInCodeAndStoryborad(userOptions.Paper.rawValue, sender: sender)
        }else if sender.tag == 1 { // Rock was choosen
            segueOnlyInCode(userOptions.Rock.rawValue)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "userPlayed"{
            
            if sender!.tag == 3 { // (Scissors) was choosen. Segue ONLY using Storyboard
                self.userPlayed = userOptions.Scissors.rawValue
            }else if sender!.tag == 2 {
                self.userPlayed = userOptions.Paper.rawValue // (Paper) was choosen. Segue using Storyboard and Code
            }
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
        
        self.userPlayed = userOptions.Rock.rawValue
        
        resultsVC = self.storyboard?.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
        let viewControllers = [self, resultsVC]
        
        setupResultsViewController()
        
        self.navigationController?.pushViewController(resultsVC, animated: true)
    }
    
    func segueInCodeAndStoryborad(userPlayed: String, sender: AnyObject){
        self.userPlayed = userPlayed
        self.performSegueWithIdentifier("userPlayed", sender: sender)
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

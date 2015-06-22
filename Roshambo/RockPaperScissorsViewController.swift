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
           case 1: self.userPlayed = userOptions.Rock.rawValue
           case 2: self.userPlayed = userOptions.Paper.rawValue
           case 3: self.userPlayed = userOptions.Scissors.rawValue
           default: println("Not a Valid Play button")
        }
        
        // Uncomment this code if you want to use Storyboard to Present the Results View Controller
        // Remember to connect segue in Storyboard and name the segue identifier "userPlayed" 
        self.performSegueWithIdentifier("userPlayed", sender: self)
        
        // Uncomment this code if you ONLY want to use code to Present the Results View Controller
        /*
        resultsVC = self.storyboard?.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
        resultsVC.userPlayed = self.userPlayed
        self.presentViewController(resultsVC, animated: true, completion: nil)
        */
        
    }
    
    // Uncomment this code if you want to use Storyboard to Present the Results View Controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "userPlayed"{
            resultsVC = segue.destinationViewController as! ResultsViewController
            gamePlay = GamePlay()
            resultsVC.result = gamePlay.resultOfRockPaperScissorsGame(self.userPlayed)
            
            if let result = gamePlay.resultOfRockPaperScissorsGame(self.userPlayed){
                history.append(result) // add the result to history array
            }
        }
    }
    
    @IBAction func historyButtonPressed(sender: UIButton) {
        historyVC = self.storyboard?.instantiateViewControllerWithIdentifier("HistoryViewController") as! HistoryViewController
        historyVC.history = self.history
        self.presentViewController(historyVC, animated: true, completion: nil)
    }
    

}

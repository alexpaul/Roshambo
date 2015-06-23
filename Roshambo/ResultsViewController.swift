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
        
    var result: Result? // result of Game Played
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let resultValue = result{
            // Update UI Elements to Reflect Result
            self.resultLabel.text = resultValue.resultString
            self.resultImageView.image = resultValue.resultImage
            
        }else{
            // NO result from Game Play
            println("Invalid Game Play Result")
        }
    }
    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        UIView.animateWithDuration(1.5){
//            self.resultImageView.alpha = 1
//        }
//    }
    
    @IBAction func playAgainButtonPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

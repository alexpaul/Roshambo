//
//  HistoryViewController.swift
//  Roshambo
//
//  Created by Alex Paul on 6/21/15.
//  Copyright (c) 2015 Alex Paul. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    
    var history = [] // match history array
    
    @IBAction func backToGameButtonPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}

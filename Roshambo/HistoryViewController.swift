//
//  HistoryViewController.swift
//  Roshambo
//
//  Created by Alex Paul on 6/21/15.
//  Copyright (c) 2015 Alex Paul. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {
    
    var history = [Result]() // match history array
    
    @IBAction func backToGameButtonPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("HistoryCell") as! UITableViewCell

        let result = self.history[indexPath.row] // current result
        
        cell.textLabel?.text = result.resultString
        cell.imageView?.image = result.resultImage
        cell.detailTextLabel?.text = result.winLoseTie
        
        return cell
    }
}

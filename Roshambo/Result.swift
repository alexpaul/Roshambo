//
//  Result.swift
//  Roshambo
//
//  Created by Alex Paul on 6/21/15.
//  Copyright (c) 2015 Alex Paul. All rights reserved.
//
//  A Result contains: a result string and a result image

import UIKit

class Result: NSObject {
    var resultString: String!
    var resultImage: UIImage!
    var winLoseTie: String!
    
    init(resultString: String, resultImage: UIImage){
        self.resultString = resultString
        self.resultImage = resultImage
    }
}

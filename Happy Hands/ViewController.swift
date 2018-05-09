//
//  ViewController.swift
//  Happy Hands
//
//  Created by Alliance Tech on 7/13/17.
//  Copyright © 2017 Alliance Tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var HighScoreLabel: UILabel!
    
    @IBOutlet weak var ActualScoreLabel: UILabel!
   
    @IBOutlet weak var StartGameButton: UIButton!
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        HighScoreLabel.layer.cornerRadius = 10.0
        StartGameButton.layer.cornerRadius = 10.0
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
      
        
        let userDefaults = Foundation.UserDefaults.standard
        let value = userDefaults.string(forKey: "Record")
        
        if( value == nil){
        
        ActualScoreLabel.text = "0"
        }
        else{
        ActualScoreLabel.text = value
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  GameViewController.swift
//  Happy Hands
//
//  Created by Alliance Tech on 7/17/17.
//  Copyright © 2017 Alliance Tech. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var TimeRemainingLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var Tapme1Label: UIButton!
    @IBOutlet weak var Conter: UILabel!
    @IBOutlet weak var gameStoper: UILabel!
    
    var tapInt = 0
    var startInt = 3
    var startTime = Timer()
    var gameInt = 10
    var gameTime = Timer()
    var recordData:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TimeRemainingLabel.layer.cornerRadius = 10.0
        ScoreLabel.layer.cornerRadius = 10.0
        Tapme1Label.layer.cornerRadius = 10.0
        tapInt = 0
        Conter.text = String(tapInt)
        startInt = 3
        Tapme1Label.setTitle(String(startInt), for: .normal)
       Tapme1Label.isEnabled = false
        
        startTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.startGameTime), userInfo: nil , repeats: true)
        
        gameInt = 10
        gameStoper.text = String(gameInt)
        
        let userDefaults = Foundation.UserDefaults.standard
        let value = userDefaults.string(forKey: "Record")
        recordData = value
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    
    @IBAction func TapmeButton1(_ sender: Any) {
        tapInt += 1
        Conter.text = String(tapInt)
        
    }
    
    func startGameTime(){
    
    startInt -= 1
        
    Tapme1Label.setTitle(String(startInt), for: .normal)
        
        if startInt == 0 {
        startTime.invalidate()
         
          Tapme1Label.setTitle("Tap me", for: .normal)
           Tapme1Label.isEnabled = true
            
            gameTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.game), userInfo: nil , repeats: true)
            
        }
        
    }
    
    func game(){
        
        gameInt -= 1
       gameStoper.text = String(gameInt)
        
        if gameInt == 0 {
            gameTime.invalidate()
            
            if( recordData == nil){
            
            let savedString = Conter.text
            let userDefaults = Foundation.UserDefaults.standard
            userDefaults.setValue(savedString, forKeyPath: "Record")
            }
            else{
                let score:Int? = Int(Conter.text!)
                let record:Int? = Int(recordData)
                
                if score! > record!{
                    let savedString = Conter.text
                    let userDefaults = Foundation.UserDefaults.standard
                    userDefaults.setValue(savedString, forKeyPath: "Record")
                
                }
                
            }
            
            Tapme1Label.isEnabled = false
            
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(GameViewController.end), userInfo: nil, repeats: false)
        
    }
    }
    
    func end(){
        
       
        
        let vcc = UIStoryboard(name: "Main" , bundle: nil ).instantiateViewController(withIdentifier: "endGame") as! EndViewController
        
        
       vcc.scoreFinalScreen = Conter.text
        
        
        
        self.present(vcc, animated: false, completion: nil)
        
    }

}

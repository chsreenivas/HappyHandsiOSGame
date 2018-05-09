//
//  EndViewController.swift
//  Happy Hands
//
//  Created by Alliance Tech on 7/17/17.
//  Copyright © 2017 Alliance Tech. All rights reserved.
//

import UIKit
import Social

class EndViewController: UIViewController {
    
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    @IBOutlet weak var EndScoreLabel: UILabel!
    
    var scoreFinalScreen:String!
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        Label1.layer.cornerRadius = 5.0
        Label2.layer.cornerRadius = 5.0
       Button1.layer.cornerRadius = 5.0
        Button2.layer.cornerRadius = 5.0
        Button3.layer.cornerRadius = 5.0
       Button4.layer.cornerRadius = 5.0
        
        EndScoreLabel.text = scoreFinalScreen
        
        
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func retry(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    
    
    @IBAction func shareTwitter(_ sender: Any) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter){
        
        let twitter:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        
        twitter.setInitialText("This my final score\(EndScoreLabel.text!)")
            
            self.present(twitter, animated: true, completion: nil)
        
        
    }
        else{
        
            let alert = UIAlertController(title: "Account", message: "Please login to twitter", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil ))
            
            
            self.present(alert, animated: true, completion: nil)
        }
    
    
    }
    
}

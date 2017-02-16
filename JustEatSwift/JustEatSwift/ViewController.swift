//
//  ViewController.swift
//  JustEatSwift
//
//  Created by Suman Chatterjee on 20/02/2016.
//  Copyright © 2016 Suman Chatterjee. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var postcodeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func performDownLoad(_ sender: AnyObject) {
        
        if postcodeTextField.text == ""{
            
            let alertView = UIAlertController(title: "Postcode error", message: "Enter a postcode", preferredStyle: .alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alertView, animated: true, completion: nil)
            return
            
        }
        else if !self.postcodeTextField.text!.isAValidPostCode(){
            
            let alertView = UIAlertController(title: "Postcode error", message: "Please enter a valid Postcode", preferredStyle: .alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alertView, animated: true, completion: nil)
            self.postcodeTextField.text = ""
            return
        }
        else
        {
            
            // using string concatination
            //let urlString = "https://public.je-apis.com/restaurants?q=" + self.postcodeTextField.text!
            
            DownloadService.downLoadRestaurants(self.postcodeTextField.text!, completionClosure: { (result:Bool) -> Void in
                
                if result {
                    print("Success")
                }
            })
            
        }
        
    }
    
    
}


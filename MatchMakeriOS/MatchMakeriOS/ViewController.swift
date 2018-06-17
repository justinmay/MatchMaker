//
//  ViewController.swift
//  MatchMakeriOS
//
//  Created by Justin May on 5/24/18.
//  Copyright © 2018 Justin May. All rights reserved.
//

import UIKit
import Alamofire
import SendBirdSDK

class ViewController: UIViewController {

    @IBOutlet weak var titleButtonLabel: UILabel!
   
    override func viewDidLoad() {
        SBDMain.initWithApplicationId("7EACC609-7836-41AC-8F5D-531161C0C05C")
        super.viewDidLoad()
        setUpViews()
        //sendPostRequest()
    }
    
    func sendPostRequest(){
        let parameters = [
            "email": "email@email.com",
            "fname": "justin",
            "lname": "may",
            "password": "password"
        ]
        
        Alamofire.request("http://cbc7eb96.ngrok.io/register", method: .post, parameters: parameters, encoding: URLEncoding.default)
        
        Alamofire.request("http://cbc7eb96.ngrok.io/test", method: .post, parameters: parameters, encoding: URLEncoding.default)
        
        print("sent Request")
    }
    
    func setUpViews() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        let gradient = CAGradientLayer()
        let top = UIColor(red:0.87, green:0.96, blue:0.27, alpha:1.0)
        let bottom = UIColor(red:1.00, green:1.00, blue:0.92, alpha:1.0)
        gradient.frame = view.bounds
        gradient.colors = [top.cgColor, bottom.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
        titleButtonLabel.textColor = UIColor(red:0.37, green:0.34, blue:0.35, alpha:1.0)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  MatchMakeriOS
//
//  Created by Justin May on 5/24/18.
//  Copyright © 2018 Justin May. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleButtonLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //titleButtonLabel.textColor = UIColor(red:0.87, green:0.96, blue:0.27, alpha:1.0)
        //userNameLabel.textColor = UIColor(red:0.87, green:0.96, blue:0.27, alpha:1.0)
        //titleLabel.textColor = UIColor(red:0.87, green:0.96, blue:0.27, alpha:1.0)
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        let gradient = CAGradientLayer()
        let top = UIColor(red:0.87, green:0.96, blue:0.27, alpha:1.0)
        let bottom = UIColor(red:1.00, green:1.00, blue:0.92, alpha:1.0)
        
        gradient.frame = view.bounds
        gradient.colors = [top.cgColor, bottom.cgColor]
        
        self.view.layer.insertSublayer(gradient, at: 0)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


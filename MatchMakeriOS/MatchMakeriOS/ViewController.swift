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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleButtonLabel.textColor = UIColor(red:0.87, green:0.96, blue:0.27, alpha:1.0)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


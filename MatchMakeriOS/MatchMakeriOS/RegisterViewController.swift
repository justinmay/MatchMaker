//
//  RegisterViewController.swift
//  MatchMakeriOS
//
//  Created by Justin May on 5/29/18.
//  Copyright © 2018 Justin May. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var registerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        let gradient = CAGradientLayer()
        let top = UIColor(red:0.87, green:0.96, blue:0.27, alpha:1.0)
        let bottom = UIColor(red:1.00, green:1.00, blue:0.92, alpha:1.0)
        
        gradient.frame = view.bounds
        gradient.colors = [top.cgColor, bottom.cgColor]
        
        self.view.layer.insertSublayer(gradient, at: 0)
        
        
        //registerLabel.textColor = UIColor(red:0.87, green:0.96, blue:0.27, alpha:1.0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  RegisterViewController.swift
//  MatchMakeriOS
//
//  Created by Justin May on 5/29/18.
//  Copyright © 2018 Justin May. All rights reserved.
//

import UIKit
import Alamofire
import SendBirdSDK

class RegisterViewController: UIViewController {

    @IBOutlet weak var registerLabel: UILabel!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLable: UITextField!
    @IBOutlet weak var invalidEmailLabel: UILabel!
    @IBOutlet weak var invalidpasswordLabel: UILabel!
    
    @IBAction func registerButtonClick(_ sender: Any) {
        //on button click
        let email = emailLabel.text
        let password = passwordLable.text
        let fullname = usernameLabel.text
        if isValidEmail(testStr: email!){
            if isValidPassword(testStr: password!){
                let items = fullname!.split(separator: " ")
                let firstName: String = String(items.first!)
                let lastName: String = String(items.last!)
                sendPostRequest(email: email!, password: password!, fname: firstName, lname: lastName)
                //setting up ChatBird
                SBDMain.connect(withUserId: email!, completionHandler: { (user, error) in
                    SBDMain.updateCurrentUserInfo(withNickname: fullname, profileUrl: "https://www.google.com/imgres?imgurl=http://www.gstatic.com/tv/thumb/persons/1805/1805_v9_bb.jpg&imgrefurl=http://google.com/search?tbm%3Disch%26q%3DDonald%2520J.%2520Trump&h=1440&w=1080&tbnid=fkDozH2oxtMs9M:&q=trump&tbnh=186&tbnw=139&usg=__gdLU87RV_aXKg2gIdNzNoFR0KTI%3D&vet=10ahUKEwirkbTGodnbAhUK9YMKHVRrBB8Q_B0I6QEwIQ..i&docid=kWEIg_incgkSTM&itg=1&sa=X&ved=0ahUKEwirkbTGodnbAhUK9YMKHVRrBB8Q_B0I6QEwIQ", completionHandler: { (error) in
                        // ...
                    })
                })
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                    self.performSegue(withIdentifier: "register2homeSegue", sender: self)
                })
            } else {
                invalidpasswordLabel.alpha = 1.0
            }
        } else {
            invalidEmailLabel.alpha = 1.0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }

    func setUpViews(){
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        let gradient = CAGradientLayer()
        let top = UIColor(red:0.87, green:0.96, blue:0.27, alpha:1.0)
        let bottom = UIColor(red:1.00, green:1.00, blue:0.92, alpha:1.0)
        
        gradient.frame = view.bounds
        gradient.colors = [top.cgColor, bottom.cgColor]
        
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
    func sendPostRequest(email:String,password:String,fname:String,lname:String){
        let parameters = [
            "email": email,
            "fname": fname,
            "lname": lname,
            "password": password
        ]
        Alamofire.request("http://280dc896.ngrok.io/register", method: .post, parameters: parameters, encoding: URLEncoding.default)
        
        print("sent Request: Register")
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func isValidPassword(testStr:String) -> Bool {
        let passwordRegEx = "[A-Z0-9a-z+-]{2,64}"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: testStr)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
        when registering users must update name and profile inside sendbird api
    */

}

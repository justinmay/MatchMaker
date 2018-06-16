//
//  ProfileViewController.swift
//  MatchMakeriOS
//
//  Created by Justin May on 5/30/18.
//  Copyright © 2018 Justin May. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, MyDelegate{
    
    @IBOutlet var profileView: UIView!
    
    var images = [UIImageView]()
    var names = [String]()
    
    let tabs: TabView = {
        let tv = TabView()
        return tv
    }()
    
    func onProfileTapped() {
        //do nothing
    }
    
    func onMessagesTapped() {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            if topController.view == profileView {
                self.performSegue(withIdentifier: "profile2messagesSegue", sender: self)
            }
            // topController should now be your topmost view controller
        }
    }
    
    func onHomeTapped(){
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            if topController.view == profileView {
                self.performSegue(withIdentifier: "profile2homeSegue", sender: self)
            }
            // topController should now be your topmost view controller
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        names += ["anand","justin"]
        // Do any additional setup after loading the view.
        setUpGradient()
        setUpViews()
    }
    
    func setUpGradient(){
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        let gradient = CAGradientLayer()
        let top = UIColor(red:0.87, green:0.96, blue:0.27, alpha:1.0)
        let bottom = UIColor(red:0.94, green:0.93, blue:0.79, alpha:1.0)
        
        gradient.frame = view.bounds
        gradient.colors = [top.cgColor, bottom.cgColor]
        
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
    func setUpViews() {
        self.view.addSubview(tabs)
        tabs.delegate = self
        
        NSLayoutConstraint.activate([
            tabs.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tabs.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            tabs.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            ])
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

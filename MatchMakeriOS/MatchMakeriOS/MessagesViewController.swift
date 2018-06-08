//
//  MessagesViewController.swift
//  MatchMakeriOS
//
//  Created by Justin May on 5/31/18.
//  Copyright © 2018 Justin May. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController, MyDelegate {

    @IBOutlet var messagesView: UIView!
    
    let tabs: TabView = {
        let tv = TabView()
        return tv
    }()
    
    //when profile is tapped
    func onProfileTapped() {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            if topController.view == messagesView {
                self.performSegue(withIdentifier: "message2profileSegue", sender: self)
            }
            // topController should now be your topmost view controller
        }
    }
    
    func onMessagesTapped() {
        //do nothing
    }
    
    func onHomeTapped() {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            if topController.view == messagesView {
                self.performSegue(withIdentifier: "messages2homeSegue", sender: self)
            }
            // topController should now be your topmost view controller
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpViews()
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

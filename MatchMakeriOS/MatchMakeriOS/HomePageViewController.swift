//
//  HomePageViewController.swift
//  MatchMakeriOS
//
//  Created by Justin May on 5/29/18.
//  Copyright © 2018 Justin May. All rights reserved.
//

import UIKit

protocol MyDelegate: class {
    func onProfileTapped()
    func onMessagesTapped()
    func onHomeTapped()
}

class HomePageViewController: UIViewController, MyDelegate {
    
    @IBOutlet var homePageView: UIView!
    
    //function to segue using delegates to profile
    func onProfileTapped() {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
        
            if topController.view == homePageView {
                self.performSegue(withIdentifier: "toProfile", sender: self)
            }
  
            // topController should now be your topmost view controller
        }
    }
    //function to segue using delegates to messages
    func onMessagesTapped() {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            if topController.view == homePageView {
                self.performSegue(withIdentifier: "home2messagesSegue", sender: self)
            }
            // topController should now be your topmost view controller
        }
    }
    //function to segue using delegate to home
    func onHomeTapped() {
         //do nothing
    }
    
    lazy var tinderCard: TinderCard = {
        let tc = TinderCard()
        tc.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(swipeCard(sender:))))
        return tc
    }()
    
    @objc func swipeCard(sender: UIPanGestureRecognizer) {
        sender.swipeView(tinderCard)
    }
    
    let tabs: TabView = {
        let tv = TabView()
        return tv
    }()
    
    let buttonsContainer: ButtonsView = {
        let c = ButtonsView()
        return c
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews() {
        //self.view.backgroundColor = UIColor.green
        self.view.addSubview(tinderCard)
        self.view.addSubview(buttonsContainer)
        self.view.addSubview(tabs)
        tabs.delegate = self
        
        NSLayoutConstraint.activate([
            tabs.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tabs.widthAnchor.constraint(equalTo: tinderCard.widthAnchor),
            tabs.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            tinderCard.topAnchor.constraint(equalTo: tabs.bottomAnchor, constant: 10),
            tinderCard.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            tinderCard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tinderCard.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.70),
            
            buttonsContainer.topAnchor.constraint(equalTo: tinderCard.bottomAnchor, constant: 50),
            buttonsContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsContainer.widthAnchor.constraint(equalTo: tinderCard.widthAnchor)
            ])
    }
}

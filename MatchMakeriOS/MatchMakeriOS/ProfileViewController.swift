//
//  ProfileViewController.swift
//  MatchMakeriOS
//
//  Created by Justin May on 5/30/18.
//  Copyright © 2018 Justin May. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, MyDelegate{
    
    let tabs: TabView = {
        let tv = TabView()
        return tv
    }()
    
    func onProfileTapped() {
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

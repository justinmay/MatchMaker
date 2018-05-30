//
//  TabView.swift
//  MatchMakeriOS
//
//  Created by Justin May on 5/30/18.
//  Copyright © 2018 Justin May. All rights reserved.
//

import UIKit

class TabView: BaseView {
    lazy var personButton: UIButton = {
        let b = ButtonFactory.buttonWithImage(image: #imageLiteral(resourceName: "personBlack"), cornerRadius: 0, target: self, selector: #selector(person), sizeToFit: true).new
        return b
    }()
    
    lazy var runButton: UIButton = {
        let b = ButtonFactory.buttonWithImage(image: #imageLiteral(resourceName: "run"), cornerRadius: 0, target: self, selector: #selector(run), sizeToFit: true).new
        return b
    }()
    
    lazy var chatButton: UIButton = {
        let b = ButtonFactory.buttonWithImage(image: #imageLiteral(resourceName: "chat"), cornerRadius: 0, target: self, selector: #selector(chat), sizeToFit: true).new
        return b
    }()
    
    lazy var container: UIStackView = {
        let c = UIStackView(arrangedSubviews: [
            self.personButton, self.runButton, self.chatButton
            ])
        c.translatesAutoresizingMaskIntoConstraints = false
        c.spacing = 20
        c.distribution = .fillEqually
        return c
    }()
    
    override func setUpViews() {
        addSubview(container)
        
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.topAnchor.constraint(equalTo: topAnchor),
            container.widthAnchor.constraint(equalTo: widthAnchor),
            container.heightAnchor.constraint(equalTo: heightAnchor)
            ])
    }
    
    weak var delegate: MyDelegate?
    
    @objc func person() {
        print("person print")
        self.delegate?.onProfileTapped()
        
    }
    @objc func run() {
        print("run print")
    }
    
    @objc func chat() {
        print("chat print")
    }
}

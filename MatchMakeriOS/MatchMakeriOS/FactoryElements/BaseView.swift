//
//  BaseView.swift
//  MatchMakeriOS
//
//  Created by Justin May on 5/29/18.
//  Copyright © 2018 Justin May. All rights reserved.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setUpViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        //perform UI configuration in child classes
    }
}

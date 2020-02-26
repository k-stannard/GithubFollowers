//
//  GFContainerView.swift
//  GithubFollowers
//
//  Created by Koty Stannard on 1/7/20.
//  Copyright © 2020 Koty Stannard. All rights reserved.
//

import UIKit

class GFContainerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContainerView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configureContainerView() {
        layer.cornerRadius = 16
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        
        backgroundColor = .systemBackground
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}

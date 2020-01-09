//
//  GFAvatarImageView.swift
//  GithubFollowers
//
//  Created by Koty Stannard on 1/9/20.
//  Copyright © 2020 Koty Stannard. All rights reserved.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let placeholderImage = UIImage(named: "avatar-placeholder")

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImageView()
    }
    
    fileprivate func configureImageView() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

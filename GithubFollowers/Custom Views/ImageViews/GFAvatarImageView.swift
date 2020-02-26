//
//  GFAvatarImageView.swift
//  GithubFollowers
//
//  Created by Koty Stannard on 1/9/20.
//  Copyright © 2020 Koty Stannard. All rights reserved.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let placeholderImage = Images.placeholder
    let cache = NetworkManager.shared.cache

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configureImageView() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(fromURL url: String) {
        NetworkManager.shared.downloadImage(from: url) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async { self.image = image }
        }
    }
}

//
//  GFFollowerItemViewController.swift
//  GithubFollowers
//
//  Created by Koty Stannard on 2/12/20.
//  Copyright © 2020 Koty Stannard. All rights reserved.
//

import UIKit

protocol GFFollowerItemControllerDelegate: class {
    func didTapGetFollowers(for user: User)
}

class GFFollowerItemViewController: GFItemInfoViewController {
    
    weak var delegate: GFFollowerItemControllerDelegate!
    
    init(user: User, delegate: GFFollowerItemControllerDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    fileprivate func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}

//
//  GFRepoItemViewController.swift
//  GithubFollowers
//
//  Created by Koty Stannard on 2/12/20.
//  Copyright © 2020 Koty Stannard. All rights reserved.
//

import UIKit

protocol GFRepoItemControllerDelegate: class {
    func didTapGitHubProfile(for user: User)
}

class GFRepoItemViewController: GFItemInfoViewController {
    
    weak var delegate: GFRepoItemControllerDelegate!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    init(user: User, delegate: GFRepoItemControllerDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    fileprivate func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  FollowerListController.swift
//  GithubFollowers
//
//  Created by Koty Stannard on 1/5/20.
//  Copyright © 2020 Koty Stannard. All rights reserved.
//

import UIKit

class FollowerListController: UIViewController {

    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

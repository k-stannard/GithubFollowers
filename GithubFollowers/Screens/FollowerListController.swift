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
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.shared.getFollowers(from: username, page: 1) { (followers, errorMessage) in
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "Error", message: errorMessage!, buttonTitle: "Okay")
                return
            }
            
            print("Followers count: \(followers.count)")
            print(followers)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

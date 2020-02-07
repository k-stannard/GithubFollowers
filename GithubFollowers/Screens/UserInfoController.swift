//
//  UserInfoController.swift
//  GithubFollowers
//
//  Created by Koty Stannard on 2/6/20.
//  Copyright © 2020 Koty Stannard. All rights reserved.
//

import UIKit

class UserInfoController: UIViewController {

    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissController))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func dismissController() {
        dismiss(animated: true)
    }
}

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
        
        NetworkManager.shared.getUserInfo(from: username) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                print(user)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Error", message: "Error retrieving user info", buttonTitle: "OK")
            }
        }
    }
    
    @objc func dismissController() {
        dismiss(animated: true)
    }
}

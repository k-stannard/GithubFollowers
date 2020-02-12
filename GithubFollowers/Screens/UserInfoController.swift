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
    
    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    let dateLabel = GFBodyLabel(textAlignment: .center)
    var itemViews = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        layoutUI()
        getUserInfo()
    }
    
    fileprivate func configureViewController() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissController))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    fileprivate func getUserInfo() {
        NetworkManager.shared.getUserInfo(from: username) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.add(childViewController: GFUserInfoHeaderController(user: user), to: self.headerView)
                    self.add(childViewController: GFRepoItemViewController(user: user), to: self.itemViewOne)
                    self.add(childViewController: GFFollowerItemViewController(user: user), to: self.itemViewTwo)
                    self.dateLabel.text = "GitHub since \(user.createdAt.convertToDisplayFormat())"
                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Error", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    fileprivate func layoutUI() {
        itemViews = [headerView, itemViewOne, itemViewTwo, dateLabel]
        let padding: CGFloat = 20
        let itemHeight: CGFloat = 140
        
        itemViews.forEach { [weak self] view in
            guard let self = self else { return }
            
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: padding),
                view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -padding),
            ])
        }

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight),
            
            dateLabel.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    fileprivate func add(childViewController: UIViewController, to containerView: UIView) {
        addChild(childViewController)
        containerView.addSubview(childViewController.view)
        childViewController.view.frame = containerView.bounds
        childViewController.didMove(toParent: self)
    }
    
    @objc func dismissController() {
        dismiss(animated: true)
    }
}

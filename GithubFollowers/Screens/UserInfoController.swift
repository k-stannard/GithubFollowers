//
//  UserInfoController.swift
//  GithubFollowers
//
//  Created by Koty Stannard on 2/6/20.
//  Copyright © 2020 Koty Stannard. All rights reserved.
//

import UIKit

protocol UserInfoControllerDelegate: class {
    func didTapGitHubProfile(for user: User)
    func didTapGetFollowers(for user: User)
}

class UserInfoController: GFDataLoadingController {

    var username: String!
    weak var delegate: FollowerListControllerDelegate!
    
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
                DispatchQueue.main.async { self.configureUIElements(with: user) }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Error", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    func configureUIElements(with user: User) {
        let repoItemController = GFRepoItemViewController(user: user)
        repoItemController.delegate = self
        
        let followerItemController = GFFollowerItemViewController(user: user)
        followerItemController.delegate = self
        
        self.add(childViewController: GFUserInfoHeaderController(user: user), to: self.headerView)
        self.add(childViewController: repoItemController, to: self.itemViewOne)
        self.add(childViewController: followerItemController, to: self.itemViewTwo)
        self.dateLabel.text = "GitHub since \(user.createdAt.convertToMonthYearFormat())"
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

extension UserInfoController: UserInfoControllerDelegate {
    
    func didTapGitHubProfile(for user: User) {
        guard let url = URL(string: user.htmlUrl) else {
            presentGFAlertOnMainThread(title: "Invalid URL", message: "The URL attached to this user is invalid.", buttonTitle: "Okay")
            return
        }
        
        presentSafariController(with: url)
    }
    
    func didTapGetFollowers(for user: User) {
        guard user.followers != 0 else {
            presentGFAlertOnMainThread(title: "No Followers", message: "This user has no followers.", buttonTitle: "Okay")
            return
        }
        delegate.didRequestFollowers(for: user.login)
        dismissController()
    }
}

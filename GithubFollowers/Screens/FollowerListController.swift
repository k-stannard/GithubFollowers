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
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        getFollowers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    fileprivate func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    fileprivate func getFollowers() {
        NetworkManager.shared.getFollowers(from: username, page: 1) { result in
            switch result {
            case .success(let followers):
                print(followers)
            case .failure(let error):
                 self.presentGFAlertOnMainThread(title: "Error", message: error.rawValue, buttonTitle: "Okay")
            }
        }
    }
    
    fileprivate func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemPink
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
}

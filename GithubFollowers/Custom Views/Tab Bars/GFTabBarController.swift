//
//  GFTabBarController.swift
//  GithubFollowers
//
//  Created by Koty Stannard on 2/22/20.
//  Copyright © 2020 Koty Stannard. All rights reserved.
//

import UIKit

class GFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTabBar()
    }
    
    fileprivate func configureTabBar() {
        UITabBar.appearance().tintColor = .systemGreen
        viewControllers = [createSearchNavController(), createFavoritesNavController()]
    }
    
    fileprivate func createSearchNavController() -> UINavigationController {
        let searchVC = SearchController()
        searchVC.title = "Search"
        searchVC.tabBarItem = .init(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    fileprivate func createFavoritesNavController() -> UINavigationController {
        let favoritesVC = FavoritesController()
        favoritesVC.title = "Favorites"
        favoritesVC.tabBarItem = .init(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favoritesVC)
    }
}

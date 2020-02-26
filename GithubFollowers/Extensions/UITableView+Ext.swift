//
//  UITableView+Ext.swift
//  GithubFollowers
//
//  Created by Koty Stannard on 2/25/20.
//  Copyright © 2020 Koty Stannard. All rights reserved.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}

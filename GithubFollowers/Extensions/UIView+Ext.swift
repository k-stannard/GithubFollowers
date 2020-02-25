//
//  UIView+Ext.swift
//  GithubFollowers
//
//  Created by Koty Stannard on 2/24/20.
//  Copyright © 2020 Koty Stannard. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach { view in
            addSubview(view)
        }
    }
}

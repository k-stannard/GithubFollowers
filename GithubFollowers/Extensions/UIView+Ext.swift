//
//  UIView+Ext.swift
//  GithubFollowers
//
//  Created by Koty Stannard on 2/24/20.
//  Copyright © 2020 Koty Stannard. All rights reserved.
//

import UIKit

extension UIView {
    
    func fillSuperview(of superview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           topAnchor.constraint(equalTo: superview.topAnchor),
           leadingAnchor.constraint(equalTo: superview.leadingAnchor),
           trailingAnchor.constraint(equalTo: superview.trailingAnchor),
           bottomAnchor.constraint(equalTo: superview.bottomAnchor),
        ])
    }
    func addSubviews(_ views: UIView...) {
        views.forEach { view in
            addSubview(view)
        }
    }
}

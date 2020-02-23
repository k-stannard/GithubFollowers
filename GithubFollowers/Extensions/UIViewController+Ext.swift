//
//  UIViewController+Ext.swift
//  GithubFollowers
//
//  Created by Koty Stannard on 1/6/20.
//  Copyright © 2020 Koty Stannard. All rights reserved.
//

import UIKit
import SafariServices

extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertView = GFAlertController(title: title, message: message, buttonTitle: buttonTitle)
            alertView.modalPresentationStyle = .overFullScreen
            alertView.modalTransitionStyle = .crossDissolve
            self.present(alertView, animated: true)
        }
    }
    
    func presentSafariController(with url: URL) {
        let safariController = SFSafariViewController(url: url)
        safariController.preferredControlTintColor = .systemGreen
        present(safariController, animated: true)
    }
}

//
//  UIView+ActivityIndicator.swift
//  GitHubPullViewer
//
//  Created by Scott A Andrew on 5/25/17.
//  Copyright © 2017 Scott A Andrew. All rights reserved.
//

import UIKit

extension UIViewController {
    func showActivityIndicator() {
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator.center = view.center
        activityIndicator.tag = 10000

        view.addSubview(activityIndicator)

        activityIndicator.startAnimating()
    }

    func removeActivityIndicator() {
        let activityView = self.view.viewWithTag(10000)

        activityView?.removeFromSuperview()
    }

}

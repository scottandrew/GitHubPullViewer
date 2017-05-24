//
//  UIAlertController+ErrorDisplay.swift
//  GitHubPullViewer
//
//  Created by Scott A Andrew on 5/24/17.
//  Copyright © 2017 Scott A Andrew. All rights reserved.
//

import UIKit

extension UIAlertController {
    convenience init(error: Error) {
        self.init(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
    }
}

//
//  GitHubPullRequestViewController.swift
//  GitHubPullViewer
//
//  Created by Scott A Andrew on 5/23/17.
//  Copyright © 2017 Scott A Andrew. All rights reserved.
//

import UIKit

class GitHubPullRequestViewController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self

        // Make sure to show the expand icon if not expaded.
        if !self.isCollapsed {
            let detail = self.viewControllers[1] as? UINavigationController

            detail?.viewControllers.last?.navigationItem.leftBarButtonItem = displayModeButtonItem
        }
    }

}

extension GitHubPullRequestViewController : UISplitViewControllerDelegate {

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {


        if let masterNavigationController = primaryViewController as? UINavigationController,
           let detailNavigationController = secondaryViewController as? UINavigationController {

            // If we are display the diff controller.
            if let diffController = detailNavigationController.viewControllers.last as? DiffTableViewController {

                // If the master is showing the changed files view controller then we can push the details
                // onto the master stack.
                if masterNavigationController.viewControllers.last is ChangedFilesTableViewController {
                    diffController.navigationItem.leftBarButtonItem = nil
                    masterNavigationController.pushViewController(diffController, animated: false)
                }
            }
        }

        // We control the collapsing so return true.
        return true
    }

    func splitViewController(_ splitViewController: UISplitViewController, separateSecondaryFrom primaryViewController: UIViewController) -> UIViewController? {

        var patch: Patch?

        // Get the top most view master view controller.
        if let navController = primaryViewController as? UINavigationController,

            // If the top most master is our diff controller then we need the patch and 
            // and pop it off thestack.
            let topMostView = navController.viewControllers.last as? DiffTableViewController {
            navController.popViewController(animated: false)
            patch = topMostView.patch
        }

        // lets look at our primary view controller's top view. navigation view then we can show
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? UINavigationController

        let newDiffController = controller?.viewControllers.first as? DiffTableViewController

        newDiffController?.navigationItem.leftBarButtonItem = displayModeButtonItem
        // set the patch that was viewed.
        newDiffController?.patch = patch

        return controller
    }

}

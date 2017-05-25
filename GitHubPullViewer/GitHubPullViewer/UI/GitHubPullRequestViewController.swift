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

        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension GitHubPullRequestViewController : UISplitViewControllerDelegate {

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {

        return true
    }

    func splitViewController(_ splitViewController: UISplitViewController, separateSecondaryFrom primaryViewController: UIViewController) -> UIViewController? {

        var patch: Patch?

        if let navController = primaryViewController as? UINavigationController,
            let topMostView = navController.viewControllers.last as? DiffTableViewController {
            navController.popViewController(animated: false)
            patch = topMostView.patch
        }

        // lets look at our primary view controller's top view. navigation view then we can show
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? UINavigationController

        let newDiffController = controller?.viewControllers.first as? DiffTableViewController
        newDiffController?.patch = patch

        return controller
    }

}

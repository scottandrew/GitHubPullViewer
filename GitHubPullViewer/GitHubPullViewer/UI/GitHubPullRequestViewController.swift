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

        if let navController = primaryViewController as? UINavigationController,
            let topMostView = navController.viewControllers.last as? DiffTableViewController {
            navController.popViewController(animated: false)
        }

        // lets look at our primary view controller's top view. navigation view then we can show
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController")

        return controller
    }
//    func splitViewController(splitViewController: UISplitViewController,
//                             collapseSecondaryViewController secondaryViewController:UIViewController,
//                             ontoPrimaryViewController primaryViewController:UIViewController) -> Bool {
//
//        //guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
//        //guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
//
////        if topAsDetailController.detailItem == nil {
////            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
////            return true
////        }
//
//        return false
//    }
}

//
//  PullRequestsTableViewController.swift
//  GitHubPullViewer
//
//  Created by Scott A Andrew on 5/23/17.
//  Copyright © 2017 Scott A Andrew. All rights reserved.
//

import UIKit

class PullRequestsTableViewController: UITableViewController {

    var pullRequests = [PullRequest]()
    let gitHub = GitHubAPI()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension

        refresh()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pullRequests.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PullRequestTableViewCell",
                                                    for: indexPath) as? PullRequestTableViewCell {
            
            cell.pullRequest = pullRequests[indexPath.row]

            return cell
        }

         // we can not return nil so return a dummy cell.
        return UITableViewCell()
    }

}

// MARK: Segue support
extension PullRequestsTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let filesViewController = segue.destination as? ChangedFilesTableViewController,
               let selectedIndex = tableView.indexPathForSelectedRow?.row {
            filesViewController.pullRequest = pullRequests[selectedIndex]
        }
    }
}

// MARK: Network and refresh.
extension PullRequestsTableViewController {
    func refresh() {


        // Show our acticity indicator
        showActivityIndicator()

        // Get the PR list.
        gitHub.getPRs  { [weak self] (pullRequests, error) in

            guard let strongSelf = self else {
                return
            }

            // No more activity indiciator needed.
            strongSelf.removeActivityIndicator()

            // Show error and refresh list (empty if error)
            DispatchQueue.main.async {
                if let error = error {
                    let alertView = UIAlertController(error: error)

                    strongSelf.present(alertView, animated: true, completion: nil)

                    return
                }

                strongSelf.pullRequests = pullRequests
                strongSelf.tableView.reloadData()
            }
        }
    }
}

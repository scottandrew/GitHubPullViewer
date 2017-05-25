//
//  DiffTableViewController.swift
//  GitHubPullViewer
//
//  Created by Scott A Andrew on 5/24/17.
//  Copyright © 2017 Scott A Andrew. All rights reserved.
//

import UIKit

class DiffTableViewController: UITableViewController {

    var patch: Patch?

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Let autolayout calculte the size of rows.
        tableView.estimatedRowHeight = 20
        tableView.rowHeight = UITableViewAutomaticDimension

        // listen for path select changed..
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onPatchSelectionChanged),
                                               name: ChangedFilesTableViewController.selectedFilesChangedNotification,
                                               object: nil)
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
        return patch?.diffLines.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // If we got a diff line cell hand it the line for the row..
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DiffLineTableViewCell", for: indexPath) as? DiffLineTableViewCell {
            cell.lineDiff = patch?.diffLines[indexPath.row]

            return cell
        }

        // Don't crash we will just show a deafult cell if things fail.
        return UITableViewCell()
    }
}

// MARK: - Notification Handlers -
extension DiffTableViewController {

    func onPatchSelectionChanged(notification: Notification) {
        patch = notification.userInfo?["patch"] as? Patch

        tableView.reloadData()
    }
}

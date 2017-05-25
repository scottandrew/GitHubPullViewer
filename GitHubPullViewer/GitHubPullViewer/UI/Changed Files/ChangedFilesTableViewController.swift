//
//  ChangeFilesTableViewController.swift
//  GitHubPullViewer
//
//  Created by Scott A Andrew on 5/24/17.
//  Copyright © 2017 Scott A Andrew. All rights reserved.
//

import UIKit

class ChangedFilesTableViewController: UITableViewController {

    static let selectedFilesChangedNotification = Notification.Name("selectedFilesChanged")

    var changedFiles = [ChangedFile]()
    var pullRequest: PullRequest?
    let gitHubAPI = GitHubAPI()

    override func viewDidLoad() {
        super.viewDidLoad()
        clearsSelectionOnViewWillAppear = false

        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        
        refresh()
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // If we are appearing and are portrait make sure nothing is selected.
        if self.view.window?.traitCollection.horizontalSizeClass == .compact {
            tableView.selectRow(at: nil, animated: false, scrollPosition: .none)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return changedFiles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ChangedFileTableViewCell", for: indexPath) as? ChangedFileTableViewCell {
            cell.changedFile = changedFiles[indexPath.row]
            
            return cell
        }

        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // If the window is not on a smaller screen we need to post a notification that we have changed
        // our selection since we can't just push on to our navigation stack.
        if self.view.window?.traitCollection.horizontalSizeClass != .compact {
            var userInfo = [AnyHashable: Any]()

            if let patch = changedFiles[indexPath.row].patch {
                userInfo["patch"] = patch
            }

            userInfo["title"] = changedFiles[indexPath.row].fileName

            // If we have a patch show it..
            NotificationCenter.default.post(name: ChangedFilesTableViewController.selectedFilesChangedNotification,
                                            object: nil,
                                            userInfo: userInfo)

        } else {
            if let diffViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DiffTableViewController") as? DiffTableViewController {

                diffViewController.title = changedFiles[indexPath.row].fileName
                diffViewController.patch = changedFiles[indexPath.row].patch
                
                self.navigationController?.pushViewController(diffViewController, animated: true)
            }
        }
    }
}

extension ChangedFilesTableViewController {
    func refresh() {
        guard let pullRequest = pullRequest else {
            return
        }

        showActivityIndicator()

        //getFiles(pullRequest: PullRequest, result: @escaping ([ChangedFile], Error?) -> Void)
        gitHubAPI.getFiles(pullRequest: pullRequest) {[weak self] (changedFiles: [ChangedFile], error: Error?) in
            guard let strongSelf = self else {
                return
            }

            DispatchQueue.main.async {
                strongSelf.removeActivityIndicator()

                if let error = error {
                    let alert = UIAlertController(error: error)
                    strongSelf.present(alert, animated: true, completion: nil)
                }

                strongSelf.changedFiles = changedFiles
                strongSelf.tableView.reloadData()
            }
        }
    }
}

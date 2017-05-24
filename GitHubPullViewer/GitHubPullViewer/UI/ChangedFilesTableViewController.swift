//
//  ChangeFilesTableViewController.swift
//  GitHubPullViewer
//
//  Created by Scott A Andrew on 5/24/17.
//  Copyright © 2017 Scott A Andrew. All rights reserved.
//

import UIKit

class ChangedFilesTableViewController: UITableViewController {

    var changedFiles = [ChangedFile]()
    var pullRequest: PullRequest?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.refresh()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return changedFiles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ChangedFileTableViewCell", for: indexPath) as? ChangedFileTableViewCell {
            cell.changedFile = changedFiles[indexPath.row]
            
            return cell
        }

        return UITableViewCell()
    }
}

extension ChangedFilesTableViewController {
    func refresh() {
        guard let pullRequest = pullRequest else {
            return
        }

        //getFiles(pullRequest: PullRequest, result: @escaping ([ChangedFile], Error?) -> Void)
        GitHubAPI().getFiles(pullRequest: pullRequest) { (changedFiles: [ChangedFile], error: Error?) in
            DispatchQueue.main.async {
                if let error = error {
                    let alert = UIAlertController(error: error)

                    self.present(alert, animated: true, completion: nil)
                }

                self.changedFiles = changedFiles
                self.tableView.reloadData()
            }
        }
    
    }
}

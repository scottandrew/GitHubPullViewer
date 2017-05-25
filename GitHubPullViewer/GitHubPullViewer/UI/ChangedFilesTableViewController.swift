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

        self.clearsSelectionOnViewWillAppear = false

        self.refresh()
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // If we are appearing and are portrait make sure nothing is selected.
        if UIDeviceOrientationIsPortrait(UIDevice.current.orientation) {
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
        if UIDeviceOrientationIsLandscape(UIDevice.current.orientation) {

        } else {
            if let diffViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DiffTableViewController") as? DiffTableViewController {

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

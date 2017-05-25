//
//  PullRequestTableViewCell.swift
//  GitHubPullViewer
//
//  Created by Scott A Andrew on 5/23/17.
//  Copyright © 2017 Scott A Andrew. All rights reserved.
//

import UIKit

class PullRequestTableViewCell: UITableViewCell {

    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()

        dateFormatter.doesRelativeDateFormatting = true
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .short

        return dateFormatter
    }()

    @IBOutlet weak var statusIconLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var extendDescriptionLabel: UILabel!

    var pullRequest: PullRequest? {
        didSet {
            nameLabel.text = pullRequest?.title

            infoLabel.text = buildInfoString()

            extendDescriptionLabel.isHidden = (pullRequest?.body.characters.count ?? 0) == 0
            extendDescriptionLabel.text = pullRequest?.body
        }
    }

}

extension PullRequestTableViewCell {
    fileprivate func buildInfoString() -> String? {

        // Build our info string if we have enough inof.
        if let pullRequest = pullRequest, let date = pullRequest.createdDate {
            var string = "Opened "

            string += PullRequestTableViewCell.dateFormatter.string(from: date)

            string += " by " + pullRequest.userName

            return string
        }
        
        return nil
    }
}

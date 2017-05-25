//
//  ChangedFileTableViewCell.swift
//  GitHubPullViewer
//
//  Created by Scott A Andrew on 5/24/17.
//  Copyright © 2017 Scott A Andrew. All rights reserved.
//

import UIKit

class ChangedFileTableViewCell: UITableViewCell {

    @IBOutlet weak var fileNameLabel: UILabel!

    var changedFile: ChangedFile? {
        didSet {
            fileNameLabel.text = changedFile?.fileName
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

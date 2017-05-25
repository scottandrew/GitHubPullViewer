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
    @IBOutlet weak var changeCountLabel: UILabel!
    @IBOutlet weak var deletionsCountLabel: UILabel!
    @IBOutlet weak var additionsCountLabel: UILabel!

    var changedFile: ChangedFile? {
        didSet {
            if let changedFile = changedFile {
                fileNameLabel.text = changedFile.fileName
                changeCountLabel.text = "\(changedFile.changes) Changes"
                deletionsCountLabel.text = "\(changedFile.deletions) Deletions"
                additionsCountLabel.text = "\(changedFile.additions) Additions"
            }
        }
    }

    override func prepareForReuse() {
        fileNameLabel.text = nil
        changeCountLabel.text = nil
        deletionsCountLabel.text = nil
        additionsCountLabel.text = nil
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

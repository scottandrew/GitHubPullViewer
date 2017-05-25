//
//  DiffLineTableViewCell.swift
//  GitHubPullViewer
//
//  Created by Scott A Andrew on 5/24/17.
//  Copyright © 2017 Scott A Andrew. All rights reserved.
//

import UIKit

class DiffLineTableViewCell: UITableViewCell {
    @IBOutlet weak var subtractionLineView: LineView!
    @IBOutlet weak var additionLineView: LineView!

    var lineDiff: DiffLine? {
        didSet {
            subtractionLineView.diff = lineDiff?.left
            additionLineView.diff = lineDiff?.right
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

//
//  LineView.swift
//  GitHubPullViewer
//
//  Created by Scott A Andrew on 5/24/17.
//  Copyright © 2017 Scott A Andrew. All rights reserved.
//

import UIKit

class LineView: UIStackView {
    @IBOutlet weak var lineNumberLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!

    var diff: Diff? {
        didSet {
            if let diff = diff {
                lineNumberLabel.text = "\(diff.lineNumber)"
                textLabel.text = diff.text
            }
            else {
                lineNumberLabel.text = nil
                textLabel.text = nil
            }
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

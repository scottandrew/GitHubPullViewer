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
    @IBOutlet weak var seperatorView: UIView!

    // These will sit under each Line view..
    lazy var subtractionBackground: UIView = {
        let view = UIView()
        return view
    }()

    lazy var additionBackground: UIView = {
        let view = UIView()
        return view
    }()

    var lineDiff: DiffLine? {
        didSet {
            subtractionLineView.diff = lineDiff?.left
            additionLineView.diff = lineDiff?.right

            // If we have text then we have to under pin it with a color. Other wise use gray 
            // to represent the void.
            if let leftText = lineDiff?.left?.text {
                if leftText.hasPrefix("-") {
                    subtractionBackground.backgroundColor = UIColor.red.withAlphaComponent(0.15)
                } else {
                    subtractionBackground.backgroundColor = UIColor.white
                }
            } else {
                subtractionBackground.backgroundColor =  UIColor.lightGray.withAlphaComponent(0.15)
            }

            // If we have text then we have to under pin it with a color. Other wise use gray
            // to represent the void.
            if let rightText = lineDiff?.right?.text {
                if rightText.hasPrefix("+") {
                    additionBackground.backgroundColor = UIColor.green.withAlphaComponent(0.15)
                } else {
                    additionBackground.backgroundColor = UIColor.white
                }
            } else {
                 additionBackground.backgroundColor = UIColor.lightGray.withAlphaComponent(0.15)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        contentView.insertSubview(subtractionBackground, at: 0)
        contentView.insertSubview(additionBackground, at: 0)
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        subtractionLineView.diff = nil
        additionLineView.diff = nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()


        subtractionBackground.frame = CGRect(x: 0,
                                             y: 0,
                                             width: contentView.bounds.width/2.0,
                                             height: contentView.bounds.height)

        additionBackground.frame = CGRect(x: contentView.bounds.width/2.0,
                                          y: 0,
                                          width: contentView.bounds.width/2.0,
                                          height: contentView.bounds.height)
    }

}

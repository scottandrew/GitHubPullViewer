//
//  PatchParser.swift
//  GitHubPullViewer
//
//  Created by Scott A Andrew on 5/24/17.
//  Copyright © 2017 Scott A Andrew. All rights reserved.
//

import Foundation

class PatchParser {
    var currentInfo: PatchInfo?
    var subtractions = [Diff?]()
    var additions = [Diff?]()
    var currentSubtractionLineNumber = 0
    var currentAdditionLineNumber = 0

    func parse(diff: String) -> Patch? {
        diff.enumerateLines { (line, done) in
            self.parse(line: line)
        }

        // Make sure we balance things out to make our display easy.
        balance()

        var lines = [DiffLine]()

        // Mash the additions and subtractions into a line.
        for (index, subtraction) in subtractions.enumerated() {
            lines.append(DiffLine(left: subtraction, right: additions[index]))
        }

        // Create a patch if we got info.
        if let currentInfo = currentInfo {
            return Patch(info: currentInfo, diffLines: lines)
        }

        // If we got here something went wrong and return nil
        return nil
    }

    fileprivate func parsePatchInfo(infoLine: String) -> PatchInfo {

        // lets split our strings at spaces.. The middle will be our values.
        let lineData = infoLine.components(separatedBy: " ").flatMap { (component) -> LineInfo? in
            if component != "@@" {
                let numbers = component.components(separatedBy: ",")

                guard let start = Int(numbers[0]), let count = Int(numbers[1]) else {
                    return nil
                }

                return LineInfo(start: abs(start), count: count)
            }

            return nil
        }


        return PatchInfo(subtractions: lineData[0], additions: lineData[1])
    }

    fileprivate func balance() {
        let difference = abs(subtractions.count - additions.count)

        // someone is not like another one.. We should the same number. Any gaps will be nil.
        if difference > 0 {
            for _ in 0 ..< difference {
                if subtractions.count < additions.count {
                    subtractions.append(nil)
                }
                else {
                    additions.append(nil)
                }
            }
        }
    }

    fileprivate func parse(line: String) {

        // We have tags to deal with the rules are:
        //
        // * Line starts with @@ we have our starting line and count
        // * + Add the line info into the additions array
        // * - Add the line info into the subractions array.
        // * If the line is not tagged we need to blance out the 
        //   arrays, padding with nil, and add the unchanged line
        //   info into both additions and deletions.
        if line.hasPrefix("@@") {
            let parseInfo = parsePatchInfo(infoLine: line)
            currentSubtractionLineNumber = parseInfo.subtractions.start
            currentAdditionLineNumber = parseInfo.additions.start

            currentInfo = parseInfo

        } else if line.hasPrefix("-") {
            subtractions.append(Diff(lineNumber: self.currentSubtractionLineNumber, text: line))
            currentSubtractionLineNumber += 1
        } else if line.hasPrefix("+") {
            additions.append(Diff(lineNumber: self.currentAdditionLineNumber, text: line))
            currentAdditionLineNumber += 1
        } else {
            balance()
            additions.append(Diff(lineNumber: self.currentAdditionLineNumber, text: line))
            subtractions.append(Diff(lineNumber: self.currentSubtractionLineNumber, text: line))

            currentAdditionLineNumber += 1
            currentSubtractionLineNumber += 1
        }
    }
}

//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let diffString = "@@ -1,6 +1,35 @@\n" +
    " ## Logging\n" +
    "-MagicalRecord has logging built in to every fetch request and other Core Data operation. When errors occur when fetching or saving data, these errors are captured by MagicalRecord. By default, these logs use NSLog to present logging information. However, if you have CocoaLumberjack installed in your project, MagicalRecord will use CocoaLumberjack and it's configuration to send logs to their proper output.\n" +
    " \n" +
    "-All logging in MagicalRecord can be disabled by placing this define preprocessor statement prior to the main import of CoreData+MagicalRecord.h\n" +
    "+MagicalRecord has logging built in to most of it's interactions with Core Data. When errors occur during fetching or saving data, these errors are captured and (if you've enabled them) logged to the console.\n" +
    " \n" +
    "-    #define MR_ENABLE_ACTIVE_RECORD_LOGGING 0\n" +
    "+Logging can be enabled by placing the following preprocessor statement before your first import of `MagicalRecord.h`, like so:\n" +
"+\n" +
    "+```objective-c\n" +
    "+#define MR_LOGGING_ENABLED 1\n" +
    "+#import <MagicalRecord/MagicalRecord.h>\n" +
    "+```\n" +
    "+\n" +
    "+Logging can be configured by calling `[MagicalRecord setLoggingLevel:…];` using one of the predefined logging masks:\n" +
    "+\n" +
    "+- **MagicalRecordLoggingLevelOff**: Don't log anything\n" +
    "+- **MagicalRecordLoggingLevelFatal**: Log all fatal messages\n" +
    "+- **MagicalRecordLoggingLevelError**: Log all errors and fatal messages\n" +
    "+- **MagicalRecordLoggingLevelWarn**: Log warnings, errors and fatal messages\n" +
    "+- **MagicalRecordLoggingLevelInfo**: Log informative, warning and error messages\n" +
    "+- **MagicalRecordLoggingLevelVerbose**: Log verbose diagnostic, informative, warning and error messages\n" +
    "+\n" +
    "+The logging level defaults to `MagicalRecordLoggingLevelVerbose`.\n" +
    "+\n" +
    "+## Disabling Logs\n" +
    "+\n" +
    "+Setting the logging mask to **MagicalRecordLoggingLevelOff** completely disables MagicalRecord's logging.\n" +
    "+\n" +
    "+## CocoaLumberjack\n" +
    "+\n" +
    "+If it's available, MagicalRecord will direct it's logs to [CocoaLumberjack](https://github.com/CocoaLumberjack/CocoaLumberjack). All you need to do is make sure you've imported CocoaLumberjack before you import MagicalRecord, like so:\n" +
    "+```objective-c\n" +
    "+#import <CocoaLumberjack/DDLog.h>\n" +
    "+#define MR_LOGGING_ENABLED 1\n" +
    "+#import <MagicalRecord/MagicalRecord.h>\n" +
    "+```"

struct Diff {
    let lineNumber: Int
    let text: String
}

struct DiffLine {
    let left: Diff?
    let right: Diff?
}

struct LineInfo {
    let start: Int
    let count: Int
}

struct PatchInfo {
    let subtractions: LineInfo
    let additions: LineInfo
}

struct Patch {
    let info: PatchInfo
    let diffLines: [DiffLine]
}

// "@@ -1,6 +1,35 @@"
func parsePatchInfo(infoLine: String) -> PatchInfo {
    print(infoLine)
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

class PatchParser {
    var currentInfo: PatchInfo?
    var subtractions = [Diff?]()
    var additions = [Diff?]()
    var currentSubtractionLineNumber = 0
    var currentAdditionLineNumber = 0

    func balance() {
        let difference = abs(subtractions.count - additions.count)

        print(difference)

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

     func parse(diff: String) -> Patch? {
        diff.enumerateLines { (line, done) in
            if line.hasPrefix("@@") {
                let parseInfo = parsePatchInfo(infoLine: line)
                self.currentSubtractionLineNumber = parseInfo.subtractions.start
                self.currentAdditionLineNumber = parseInfo.additions.start

                self.currentInfo = parseInfo

            } else if line.hasPrefix("-") {
                self.subtractions.append(Diff(lineNumber: self.currentSubtractionLineNumber, text: line))
                self.currentSubtractionLineNumber += 1
            } else if line.hasPrefix("+") {
                self.additions.append(Diff(lineNumber: self.currentAdditionLineNumber, text: line))
                self.currentAdditionLineNumber += 1
            } else {
                self.balance()
                self.additions.append(Diff(lineNumber: self.currentAdditionLineNumber, text: line))
                self.subtractions.append(Diff(lineNumber: self.currentSubtractionLineNumber, text: line))

                self.currentAdditionLineNumber += 1
                self.currentSubtractionLineNumber += 1
            }
        }

        balance()

        var lines = [DiffLine]()

        /// Now go create our structure
        for (index, subtraction) in subtractions.enumerated() {
            lines.append(DiffLine(left: subtraction, right: additions[index]))
        }

        if let currentInfo = currentInfo {
            return Patch(info: currentInfo, diffLines: lines)
        }

        return nil
    }
}



let parser = PatchParser()
let patch = parser.parse(diff: diffString)

parser.subtractions.count
parser.additions.count

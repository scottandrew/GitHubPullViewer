//
//  ChangeFileParser.swift
//  GitHubPullViewer
//
//  Created by Scott A Andrew on 5/24/17.
//  Copyright © 2017 Scott A Andrew. All rights reserved.
//

import XCTest

@testable import GitHubPullViewer

class ChangeFileParser: XCTestCase {

    let fileDictionary: [String : Any] = [
        "sha" : "d9122686ebc5ce0eeefcb49a9e2c85cabf609838",
        "filename" : ".clang-format",
        "status" : "added",
        "additions" : 38,
        "deletions" : 0,
        "changes" : 38,
        "blob_url" : "https://github.com/magicalpanda/MagicalRecord/blob/b1e621cf0557d5d1f245658ae9adb6004081bef6/.clang-format",
        "raw_url" : "https://github.com/magicalpanda/MagicalRecord/raw/b1e621cf0557d5d1f245658ae9adb6004081bef6/.clang-format",
        "contents_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/contents/.clang-format?ref=b1e621cf0557d5d1f245658ae9adb6004081bef6",
        "patch" : "@@ -0,0 +1,38 @@\n+BasedOnStyle: Chromium"]

    func testchangedFileParser() {
        let changedFile = ChangedFile(jsonData: fileDictionary)

        XCTAssertEqual(changedFile.fileName, ".clang-format")
        XCTAssertEqual(changedFile.status, .added)
    }
    
}

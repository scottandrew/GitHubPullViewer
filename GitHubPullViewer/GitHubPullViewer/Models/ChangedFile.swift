//
//  ChangedFile.swift
//  GitHubPullViewer
//
//  Created by Scott A Andrew on 5/24/17.
//  Copyright © 2017 Scott A Andrew. All rights reserved.
//

import Foundation

struct ChangedFile {
    enum Status: String {
        case unknown // Just in case.
        case added
        case modified
        case removed
    }

    let fileName: String
    let status: Status
    let patch: Patch?
    let changes: Int
    let deletions: Int
    let additions: Int

    init(jsonData: [String: Any]) {
        fileName = jsonData["filename"] as? String ?? ""

        if let statusString = jsonData["status"] as? String {
            status = Status(rawValue: statusString) ?? .unknown
        }
        else {
            status = .unknown
        }

        if let diff = jsonData["patch"] as? String {
            patch = PatchParser().parse(diff: diff)
        } else {
            patch = nil
        }

        changes = jsonData["changes"] as? Int ?? 0
        additions = jsonData["additions"] as? Int ?? 0
        deletions = jsonData["deletions"] as? Int ?? 0
    }
}

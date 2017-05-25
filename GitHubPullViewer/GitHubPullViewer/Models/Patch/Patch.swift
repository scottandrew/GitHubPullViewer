//
//  Patch.swift
//  GitHubPullViewer
//
//  Created by Scott A Andrew on 5/24/17.
//  Copyright © 2017 Scott A Andrew. All rights reserved.
//
// Structures that make up the git patch.

import Foundation

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

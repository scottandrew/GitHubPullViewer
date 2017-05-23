//
//  Repository.swift
//  GitHubPullViewer
//
//  Created by Scott A Andrew on 5/22/17.
//  Copyright © 2017 Scott A Andrew. All rights reserved.
//

import Foundation

struct PullRequest {
    let id: Int
    let number: Int
    let body: String
    let title: String
    let userName: String
    let createdDate: Date?

    init(jsonData: [String: Any]) {
        id = jsonData["id"] as? Int ?? -1
        number = jsonData["number"] as? Int ?? -1
        body = jsonData["body"] as? String ?? ""
        title = jsonData["title"] as? String ?? ""

        if let userData = jsonData["user"] as? [String: Any] {
            userName = userData["login"] as? String ?? ""
        } else {
            userName = ""
        }

        if let dateString = jsonData["created_at"] as? String {
            createdDate =  ISO8601DateFormatter().date(from:dateString)
        } else {
            createdDate = Date()
        }
    }
}

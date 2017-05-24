//
//  PullRequestParser.swift
//  GitHubPullViewer
//
//  Created by Scott A Andrew on 5/23/17.
//  Copyright © 2017 Scott A Andrew. All rights reserved.
//

import XCTest

@testable import GitHubPullViewer

class PullRequestParser: XCTestCase {

    let pullRequestDictionary: [String : Any] = [
        "url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/pulls/1305",
        "id" : 121618349,
        "html_url" : "https://github.com/magicalpanda/MagicalRecord/pull/1305",
        "diff_url" : "https://github.com/magicalpanda/MagicalRecord/pull/1305.diff",
        "patch_url" : "https://github.com/magicalpanda/MagicalRecord/pull/1305.patch",
        "issue_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/issues/1305",
        "number" : 1305,
        "state" : "open",
        "locked" : false,
        "title" : "fix typos using misspell",
        "user" : [
            "login" : "Lutzifer",
            "id" : 194417,
            "avatar_url" : "https://avatars1.githubusercontent.com/u/194417?v=3",
            "gravatar_id" : "",
            "url" : "https://api.github.com/users/Lutzifer",
            "html_url" : "https://github.com/Lutzifer",
            "followers_url" : "https://api.github.com/users/Lutzifer/followers",
            "following_url" : "https://api.github.com/users/Lutzifer/following{/other_user}",
            "gists_url" : "https://api.github.com/users/Lutzifer/gists{/gist_id}",
            "starred_url" : "https://api.github.com/users/Lutzifer/starred{/owner}{/repo}",
            "subscriptions_url" : "https://api.github.com/users/Lutzifer/subscriptions",
            "organizations_url" : "https://api.github.com/users/Lutzifer/orgs",
            "repos_url" : "https://api.github.com/users/Lutzifer/repos",
            "events_url" : "https://api.github.com/users/Lutzifer/events{/privacy}",
            "received_events_url" : "https://api.github.com/users/Lutzifer/received_events",
            "type" : "User",
            "site_admin" : false
        ],
        "body" : "This PR is part of a campaign to fix a lot of typos on github using https://github.com/client9/misspell!\nYou can see the progress on https://github.com/fixTypos/fix_typos/",
        "created_at" : "2017-05-20T10:07:40Z",
        "updated_at" : "2017-05-20T10:07:40Z",
        "closed_at" : NSNull(),
        "merged_at" : NSNull(),
        "merge_commit_sha" : "27dcea23ff49f7d7d8c9a39fced1032e9d9f2e2d",
        "assignee" : NSNull(),
        "assignees" : [],
        "requested_reviewers" : [],
        "milestone" : NSNull(),
        "commits_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/pulls/1305/commits",
        "review_comments_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/pulls/1305/comments",
        "review_comment_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/pulls/comments{/number}",
        "comments_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/issues/1305/comments",
        "statuses_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/statuses/ec469a3d99db6cc6c289a58cd9c03cca731e6a82",
        "head" : [
            "label" : "fixTypos:fix_typos",
            "ref" : "fix_typos",
            "sha" : "ec469a3d99db6cc6c289a58cd9c03cca731e6a82",
            "user" : [
                "login" : "fixTypos",
                "id" : 28632425,
                "avatar_url" : "https://avatars2.githubusercontent.com/u/28632425?v=3",
                "gravatar_id" : "",
                "url" : "https://api.github.com/users/fixTypos",
                "html_url" : "https://github.com/fixTypos",
                "followers_url" : "https://api.github.com/users/fixTypos/followers",
                "following_url" : "https://api.github.com/users/fixTypos/following{/other_user}",
                "gists_url" : "https://api.github.com/users/fixTypos/gists{/gist_id}",
                "starred_url" : "https://api.github.com/users/fixTypos/starred{/owner}{/repo}",
                "subscriptions_url" : "https://api.github.com/users/fixTypos/subscriptions",
                "organizations_url" : "https://api.github.com/users/fixTypos/orgs",
                "repos_url" : "https://api.github.com/users/fixTypos/repos",
                "events_url" : "https://api.github.com/users/fixTypos/events{/privacy}",
                "received_events_url" : "https://api.github.com/users/fixTypos/received_events",
                "type" : "Organization",
                "site_admin" : false
            ],
            "repo" : [
                "id" : 91876388,
                "name" : "MagicalRecord",
                "full_name" : "fixTypos/MagicalRecord",
                "owner" : [
                    "login" : "fixTypos",
                    "id" : 28632425,
                    "avatar_url" : "https://avatars2.githubusercontent.com/u/28632425?v=3",
                    "gravatar_id" : "",
                    "url" : "https://api.github.com/users/fixTypos",
                    "html_url" : "https://github.com/fixTypos",
                    "followers_url" : "https://api.github.com/users/fixTypos/followers",
                    "following_url" : "https://api.github.com/users/fixTypos/following{/other_user}",
                    "gists_url" : "https://api.github.com/users/fixTypos/gists{/gist_id}",
                    "starred_url" : "https://api.github.com/users/fixTypos/starred{/owner}{/repo}",
                    "subscriptions_url" : "https://api.github.com/users/fixTypos/subscriptions",
                    "organizations_url" : "https://api.github.com/users/fixTypos/orgs",
                    "repos_url" : "https://api.github.com/users/fixTypos/repos",
                    "events_url" : "https://api.github.com/users/fixTypos/events{/privacy}",
                    "received_events_url" : "https://api.github.com/users/fixTypos/received_events",
                    "type" : "Organization",
                    "site_admin" : false
                ],
                "private" : false,
                "html_url" : "https://github.com/fixTypos/MagicalRecord",
                "description" : "Super Awesome Easy Fetching for Core Data 1!!!11!!!!1!",
                "fork" : true,
                "url" : "https://api.github.com/repos/fixTypos/MagicalRecord",
                "forks_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/forks",
                "keys_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/keys{/key_id}",
                "collaborators_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/collaborators{/collaborator}",
                "teams_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/teams",
                "hooks_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/hooks",
                "issue_events_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/issues/events{/number}",
                "events_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/events",
                "assignees_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/assignees{/user}",
                "branches_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/branches{/branch}",
                "tags_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/tags",
                "blobs_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/git/blobs{/sha}",
                "git_tags_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/git/tags{/sha}",
                "git_refs_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/git/refs{/sha}",
                "trees_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/git/trees{/sha}",
                "statuses_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/statuses/{sha}",
                "languages_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/languages",
                "stargazers_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/stargazers",
                "contributors_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/contributors",
                "subscribers_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/subscribers",
                "subscription_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/subscription",
                "commits_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/commits{/sha}",
                "git_commits_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/git/commits{/sha}",
                "comments_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/comments{/number}",
                "issue_comment_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/issues/comments{/number}",
                "contents_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/contents/{+path}",
                "compare_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/compare/{base}...{head}",
                "merges_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/merges",
                "archive_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/{archive_format}{/ref}",
                "downloads_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/downloads",
                "issues_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/issues{/number}",
                "pulls_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/pulls{/number}",
                "milestones_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/milestones{/number}",
                "notifications_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/notifications{?since,all,participating}",
                "labels_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/labels{/name}",
                "releases_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/releases{/id}",
                "deployments_url" : "https://api.github.com/repos/fixTypos/MagicalRecord/deployments",
                "created_at" : "2017-05-20T08:39:01Z",
                "updated_at" : "2017-05-20T08:39:03Z",
                "pushed_at" : "2017-05-20T10:01:33Z",
                "git_url" : "git://github.com/fixTypos/MagicalRecord.git",
                "ssh_url" : "git@github.com:fixTypos/MagicalRecord.git",
                "clone_url" : "https://github.com/fixTypos/MagicalRecord.git",
                "svn_url" : "https://github.com/fixTypos/MagicalRecord",
                "homepage" : "",
                "size" : 7951,
                "stargazers_count" : 0,
                "watchers_count" : 0,
                "language" : "Objective-C",
                "has_issues" : false,
                "has_projects" : true,
                "has_downloads" : true,
                "has_wiki" : true,
                "has_pages" : false,
                "forks_count" : 0,
                "mirror_url" : NSNull(),
                "open_issues_count" : 0,
                "forks" : 0,
                "open_issues" : 0,
                "watchers" : 0,
                "default_branch" : "master"
            ]
        ],
        "base" : [
            "label" : "magicalpanda:master",
            "ref" : "master",
            "sha" : "94762ad5d8f57d508fd4d6c719bdcba18a36bf27",
            "user" : [
                "login" : "magicalpanda",
                "id" : 130841,
                "avatar_url" : "https://avatars2.githubusercontent.com/u/130841?v=3",
                "gravatar_id" : "",
                "url" : "https://api.github.com/users/magicalpanda",
                "html_url" : "https://github.com/magicalpanda",
                "followers_url" : "https://api.github.com/users/magicalpanda/followers",
                "following_url" : "https://api.github.com/users/magicalpanda/following{/other_user}",
                "gists_url" : "https://api.github.com/users/magicalpanda/gists{/gist_id}",
                "starred_url" : "https://api.github.com/users/magicalpanda/starred{/owner}{/repo}",
                "subscriptions_url" : "https://api.github.com/users/magicalpanda/subscriptions",
                "organizations_url" : "https://api.github.com/users/magicalpanda/orgs",
                "repos_url" : "https://api.github.com/users/magicalpanda/repos",
                "events_url" : "https://api.github.com/users/magicalpanda/events{/privacy}",
                "received_events_url" : "https://api.github.com/users/magicalpanda/received_events",
                "type" : "Organization",
                "site_admin" : false
            ],
            "repo" : [
                "id" : 801795,
                "name" : "MagicalRecord",
                "full_name" : "magicalpanda/MagicalRecord",
                "owner" : [
                    "login" : "magicalpanda",
                    "id" : 130841,
                    "avatar_url" : "https://avatars2.githubusercontent.com/u/130841?v=3",
                    "gravatar_id" : "",
                    "url" : "https://api.github.com/users/magicalpanda",
                    "html_url" : "https://github.com/magicalpanda",
                    "followers_url" : "https://api.github.com/users/magicalpanda/followers",
                    "following_url" : "https://api.github.com/users/magicalpanda/following{/other_user}",
                    "gists_url" : "https://api.github.com/users/magicalpanda/gists{/gist_id}",
                    "starred_url" : "https://api.github.com/users/magicalpanda/starred{/owner}{/repo}",
                    "subscriptions_url" : "https://api.github.com/users/magicalpanda/subscriptions",
                    "organizations_url" : "https://api.github.com/users/magicalpanda/orgs",
                    "repos_url" : "https://api.github.com/users/magicalpanda/repos",
                    "events_url" : "https://api.github.com/users/magicalpanda/events{/privacy}",
                    "received_events_url" : "https://api.github.com/users/magicalpanda/received_events",
                    "type" : "Organization",
                    "site_admin" : false
                ],
                "private" : false,
                "html_url" : "https://github.com/magicalpanda/MagicalRecord",
                "description" : "Super Awesome Easy Fetching for Core Data 1!!!11!!!!1!",
                "fork" : false,
                "url" : "https://api.github.com/repos/magicalpanda/MagicalRecord",
                "forks_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/forks",
                "keys_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/keys{/key_id}",
                "collaborators_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/collaborators{/collaborator}",
                "teams_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/teams",
                "hooks_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/hooks",
                "issue_events_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/issues/events{/number}",
                "events_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/events",
                "assignees_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/assignees{/user}",
                "branches_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/branches{/branch}",
                "tags_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/tags",
                "blobs_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/git/blobs{/sha}",
                "git_tags_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/git/tags{/sha}",
                "git_refs_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/git/refs{/sha}",
                "trees_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/git/trees{/sha}",
                "statuses_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/statuses/{sha}",
                "languages_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/languages",
                "stargazers_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/stargazers",
                "contributors_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/contributors",
                "subscribers_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/subscribers",
                "subscription_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/subscription",
                "commits_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/commits{/sha}",
                "git_commits_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/git/commits{/sha}",
                "comments_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/comments{/number}",
                "issue_comment_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/issues/comments{/number}",
                "contents_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/contents/{+path}",
                "compare_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/compare/{base}...{head}",
                "merges_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/merges",
                "archive_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/{archive_format}{/ref}",
                "downloads_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/downloads",
                "issues_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/issues{/number}",
                "pulls_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/pulls{/number}",
                "milestones_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/milestones{/number}",
                "notifications_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/notifications{?since,all,participating}",
                "labels_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/labels{/name}",
                "releases_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/releases{/id}",
                "deployments_url" : "https://api.github.com/repos/magicalpanda/MagicalRecord/deployments",
                "created_at" : "2010-07-27T23:58:18Z",
                "updated_at" : "2017-05-23T09:14:34Z",
                "pushed_at" : "2017-05-20T10:07:41Z",
                "git_url" : "git://github.com/magicalpanda/MagicalRecord.git",
                "ssh_url" : "git@github.com:magicalpanda/MagicalRecord.git",
                "clone_url" : "https://github.com/magicalpanda/MagicalRecord.git",
                "svn_url" : "https://github.com/magicalpanda/MagicalRecord",
                "homepage" : "",
                "size" : 7948,
                "stargazers_count" : 10322,
                "watchers_count" : 10322,
                "language" : "Objective-C",
                "has_issues" : true,
                "has_projects" : true,
                "has_downloads" : true,
                "has_wiki" : true,
                "has_pages" : true,
                "forks_count" : 1848,
                "mirror_url" : NSNull(),
                "open_issues_count" : 271,
                "forks" : 1848,
                "open_issues" : 271,
                "watchers" : 10322,
                "default_branch" : "master"
            ]
        ],
        "_links" : [
            "self" : ["href" : "https://api.github.com/repos/magicalpanda/MagicalRecord/pulls/1305"],
            "html" : ["href" : "https://github.com/magicalpanda/MagicalRecord/pull/1305"],
            "issue" : ["href" : "https://api.github.com/repos/magicalpanda/MagicalRecord/issues/1305"],
            "comments" : ["href" : "https://api.github.com/repos/magicalpanda/MagicalRecord/issues/1305/comments"],
            "review_comments" : ["href" : "https://api.github.com/repos/magicalpanda/MagicalRecord/pulls/1305/comments"],
            "review_comment" : ["href" : "https://api.github.com/repos/magicalpanda/MagicalRecord/pulls/comments{/number}"],
            "commits" : ["href" : "https://api.github.com/repos/magicalpanda/MagicalRecord/pulls/1305/commits"],
            "statuses" : ["href" : "https://api.github.com/repos/magicalpanda/MagicalRecord/statuses/ec469a3d99db6cc6c289a58cd9c03cca731e6a82"]
        ]
    ]

    func testPullRequestParsing() {
        let pullRequest = PullRequest(jsonData: pullRequestDictionary)

        // Verify the elements are grabbed from the JSON as expected.
        XCTAssertEqual(pullRequest.id, 121618349)
        XCTAssertEqual(pullRequest.number, 1305)
        XCTAssertEqual(pullRequest.title, "fix typos using misspell")
        XCTAssertEqual(pullRequest.userName, "Lutzifer")

        XCTAssertEqual(pullRequest.body, pullRequestDictionary["body"] as? String ?? "")

        if let dateString = pullRequestDictionary["created_at"] as? String {
            XCTAssertEqual(pullRequest.createdDate, ISO8601DateFormatter().date(from: dateString) ?? Date())
        }
    }
    
}

//
//  GitHubAPI.swift
//  GitHubPullViewer
//
//  Created by Scott A Andrew on 5/22/17.
//  Copyright © 2017 Scott A Andrew. All rights reserved.
//

import Foundation

enum GitHubAPIError: Error {
    case networkError(String)
    case responseError(String)
}

class GitHubAPI {
    fileprivate let baseURL = "https://api.github.com/repos/magicalpanda/MagicalRecord/"
    fileprivate let successRange = 200...299
    let session = URLSession(configuration: URLSessionConfiguration.default)

    private func makeAPICall(request: URLRequest, arguments: [String:Any]?, responseHandler: @escaping (Any?, Error?) -> Void) {


         let task = session.dataTask(with: request) { [weak self] (data: Data?, response: URLResponse?, error: Error?) in

            guard let strongSelf = self else {
                return
            }

            if let error = error {
                responseHandler(nil, error)
                return
            }

            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])

                    if let response = response as? HTTPURLResponse {
                        // Short cut to see if value is in the range.
                        if strongSelf.successRange ~= response.statusCode {
                            responseHandler(json, nil)
                        } else {
                            responseHandler(nil, GitHubAPIError.networkError("Resposne error \(response.statusCode)"))
                        }
                    }
                    else {
                        responseHandler(nil, GitHubAPIError.networkError("Resposne error"))
                    }
                } catch {
                    responseHandler(nil, GitHubAPIError.networkError("Can't parse data"))
                }
            }
        }

        task.resume()
    }

    func getPRs(result: @escaping ([PullRequest], Error?) -> Void) {
        if let URL = URL(string: baseURL + "pulls") {
            var request = URLRequest(url: URL)
            request.httpMethod = "GET"

            makeAPICall(request: request,
                        arguments: nil) { (jsonData: Any?, error: Error?) in

                var pullRequests = [PullRequest]()

                if let jsonData = jsonData as? [[String: Any]] {
                    pullRequests = jsonData.flatMap { PullRequest(jsonData: $0) }
                }

                result(pullRequests, error)
            }
        }
    }

    func getFiles(pullRequest: PullRequest, result: @escaping ([ChangedFile], Error?) -> Void) {
        if let URL = URL(string: baseURL + "pulls/\(pullRequest.number)/files") {
            var request = URLRequest(url: URL)
            request.httpMethod = "GET"

            makeAPICall(request: request,
                        arguments: nil) { (jsonData: Any, error: Error?) in

                var files = [ChangedFile]()

                if let jsonData = jsonData as? [[String: Any]] {
                    files = jsonData.flatMap { ChangedFile(jsonData: $0) }
                }

                result(files, error)
            }
        }
    }
}

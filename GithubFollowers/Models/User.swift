//
//  User.swift
//  GithubFollowers
//
//  Created by Koty Stannard on 1/8/20.
//  Copyright © 2020 Koty Stannard. All rights reserved.
//

import Foundation

class User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var followers: Int
    var following: Int
    var createdAt: String
}

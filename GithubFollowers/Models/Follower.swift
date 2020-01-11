//
//  Follower.swift
//  GithubFollowers
//
//  Created by Koty Stannard on 1/8/20.
//  Copyright © 2020 Koty Stannard. All rights reserved.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
}

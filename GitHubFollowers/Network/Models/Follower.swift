//
//  Follower.swift
//  GitHubFollowers
//
//  Created by Mohamed Elbana on 3/31/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import Foundation

struct Follower: Codable, Hashable {
    
    let login: String
    let avatarUrl: String
    let htmlUrl: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(login)
    }
}

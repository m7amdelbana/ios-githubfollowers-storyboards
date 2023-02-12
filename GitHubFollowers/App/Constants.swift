//
//  Constants.swift
//  GitHubFollowers
//
//  Created by Mohamed Elbana on 3/31/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

func localizedText(_ key: String) -> String {
    return LOCAL.localizedString(key: key)
}

enum Symbols {
    static let map = UIImage(systemName: "mappin.and.ellipse")
    static let repos = UIImage(systemName: "folder")
    static let gists = UIImage(systemName: "text.alignleft")
    static let followers = UIImage(systemName: "heart")
    static let following = UIImage(systemName: "person.2")
}

enum Images {
    static let ghLogo = UIImage(named: "gh-logo")
    static let emptyStateLogo = UIImage(named: "empty-state-logo")
    static let avatarPlaceholder = UIImage(named: "avatar-placeholder")
}


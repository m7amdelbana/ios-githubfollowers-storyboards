//
//  FollowerCell.swift
//  GitHubFollowers
//
//  Created by Mohamed Elbana on 4/8/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    
    @IBOutlet weak var imgAvatar: AvatarImageView!
    @IBOutlet weak var lblUsername: UILabel!
    
    func configure(with follower: Follower) {
        lblUsername.text = follower.login
        imgAvatar.load(from: follower.avatarUrl)
    }
}

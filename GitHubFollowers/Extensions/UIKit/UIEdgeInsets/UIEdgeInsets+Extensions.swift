//
//  UIEdgeInsets+Extensions.swift
//  GitHubFollowers
//
//  Created by Mohamed Elbana on 4/9/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

extension UIEdgeInsets {
    
    init(t top: CGFloat, l left: CGFloat, b bottom: CGFloat, r right: CGFloat) {
        self.init(top: top, left: left, bottom: bottom, right: right)
    }
    
    init(all value: CGFloat) {
        self.init(t: value, l: value, b: value, r: value)
    }
}

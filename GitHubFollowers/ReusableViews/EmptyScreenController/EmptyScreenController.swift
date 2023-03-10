//
//  EmptyScreenController.swift
//  GitHubFollowers
//
//  Created by Mohamed Elbana on 3/31/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

class EmptyScreenController: UIViewController {
    
    @IBOutlet weak var lblMessage: UILabel!
    
    var message: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblMessage.text = message
    }
    
    func show(in view: UIView) {
        DispatchQueue.main.async {
            self.view.frame.size = view.bounds.size
            view.addSubview(self.view)
        }
    }
    
    func close() {
        DispatchQueue.main.async {
            self.view.removeFromSuperview()
        }
    }
}

//
//  AlertController.swift
//  GitHubFollowers
//
//  Created by Mohamed Elbana on 3/31/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

let ALERT = AlertController.shared

class AlertController: UIViewController {
    
    static let shared = AlertController()
    var alert: UIAlertController = UIAlertController()
    
    func show(in vc: UIViewController?, title: String? = localizedText("error_title"), message: String? = localizedText("error_message"), btnTitle: String? = localizedText("ok")) {
        alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: btnTitle, style: .default))
        vc?.present(alert, animated: true, completion: nil)
    }
}

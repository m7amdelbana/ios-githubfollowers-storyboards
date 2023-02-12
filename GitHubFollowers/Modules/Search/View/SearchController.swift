//
//  SearchController.swift
//  GitHubFollowers
//
//  Created by Mohamed Elbana on 3/31/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

class SearchController: BaseController {
    
    @IBOutlet weak var txtFldUsername: TextField!
    @IBOutlet weak var btnGetFollowers: Button!
    
    var presenter: SearchPresenterInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        dismissKeyboardTapGesture(view: view)
    }
    
    private func setupView() {
        txtFldUsername.placeholder = localizedText("enter_a_username")
        txtFldUsername.returnKeyType = .go
        txtFldUsername.delegate = self
        btnGetFollowers.setTitle("get_followers")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func getFollowersAction(_ sender: Any) {
        getFollowers()
    }
    
    func getFollowers() {
        if txtFldUsername.text?.isEmpty ?? true {
            presenter.presentAlert(localizedText("enter_username"), localizedText("enter_username_message"))
        } else {
            let username = txtFldUsername.text!
            txtFldUsername.resignFirstResponder()
            txtFldUsername.text = ""
            presenter.didClickedGetFollowers(username)
        }
    }
}

extension SearchController: SearchView {
    
    
}

extension SearchController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case txtFldUsername:
            getFollowers()
        default:
            break
        }
        return true
    }
}

//
//  SearchPresenter.swift
//  GitHubFollowers
//
//  Created by Mohamed Elbana on 3/31/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

class SearchPresenter: SearchPresenterInterface {

    weak var view: SearchView?
    var router: SearchRouterInterface!
    var interactor: SearchInteractorInterface!
    
    func didClickedGetFollowers(_ username: String) {
        router.presentFollowers(username)
    }
    
    func presentAlert(_ title: String, _ message: String) {
        router.presentAlert(title, message)
    }
}
    
extension SearchPresenter: SearchInteractorOutput {
        
}

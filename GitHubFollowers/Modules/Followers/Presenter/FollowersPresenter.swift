//
//  FollowersPresenter.swift
//  GitHubFollowers
//
//  Created by Mohamed Elbana on 4/8/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

class FollowersPresenter: FollowersPresenterInterface {
    
    weak var view: FollowersView?
    var router: FollowersRouterInterface!
    var interactor: FollowersInteractorInterface!
    
    var username: String!
    var followers: [Follower] = []
    var filteredFollowers: [Follower] = []
    var paginate: Paginate = Paginate()
    
    func viewDidLoad() {
        view?.setTitle(username)
        view?.setupView()
        getFollowers()
    }
    
    func getFollowers() {
        if paginate.isMoreData && !paginate.isLoading {
            view?.showLoading()
            self.paginate.isLoading = true
            interactor.getFollowers(username: username, paginate: paginate)
        }
    }
    
    func searchBarCancelButtonClicked() {
        filteredFollowers.removeAll()
        view?.updateUI(on: followers)
    }
    
    func updateSearchResults(_ filter: String?) {
        guard let filter = filter, !filter.isEmpty else {
            filteredFollowers.removeAll()
            view?.updateUI(on: followers)
            return
        }
        
        filteredFollowers = followers.filter({ $0.login.lowercased().contains(filter.lowercased()) })
        view?.updateUI(on: filteredFollowers)
    }
}

extension FollowersPresenter: FollowersInteractorOutput {
    
    func didGetFollowers(_ followers: [Follower]) {
        paginate.isMoreData = (followers.count == paginate.perPage)
        paginate.page += 1
        
        self.followers.append(contentsOf: followers)
        
        if self.followers.isEmpty {
            view?.presentEmptyScreen()
        } else {
            view?.closeEmptyScreen()
            view?.updateUI(on: self.followers)
        }
    }
    
    func didFailedGetFollowers(_ error: APIError) {
        router.presentAlert(message: error.message)
    }
    
    func didCompleteGetFollowers() {
        self.paginate.isLoading = false
        view?.closeLoading()
    }
}

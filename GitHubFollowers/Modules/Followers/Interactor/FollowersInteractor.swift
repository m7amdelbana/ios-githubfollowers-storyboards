//
//  FollowersInteractor.swift
//  GitHubFollowers
//
//  Created by Mohamed Elbana on 4/8/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit
    
class FollowersInteractor: FollowersInteractorInterface {

    weak var output: FollowersInteractorOutput?
    
    func getFollowers(username: String, paginate: Paginate) {
        USERS.followers(for: username, perPage: paginate.perPage, page: paginate.page) { [weak self] response in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch response {
                case let .onSuccess(followers):
                    self.output?.didGetFollowers(followers)
                    break
                case let .onFailure(error):
                    self.output?.didFailedGetFollowers(error)
                    break
                case .onCompleted:
                    self.output?.didCompleteGetFollowers()
                    break
                }
            }
        }
    }
}

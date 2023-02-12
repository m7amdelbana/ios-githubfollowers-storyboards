//
//  FollowersContract.swift
//  GitHubFollowers
//
//  Created by Mohamed Elbana on 4/8/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

protocol FollowersView: AnyObject {
    var presenter: FollowersPresenterInterface! { get set }
    
    func setupView()
    func setTitle(_ title: String)
    func updateUI(on followers: [Follower])
    
    func showLoading()
    func closeLoading()
    
    func presentEmptyScreen()
    func closeEmptyScreen()
}
    
protocol FollowersPresenterInterface: AnyObject {
    var view: FollowersView? { get set }
    var router: FollowersRouterInterface! { get set }
    var interactor: FollowersInteractorInterface! { get set }
    
    var username: String! { get set }
    var followers: [Follower] { get set }
    var filteredFollowers: [Follower] { get set }
    var paginate: Paginate { get set }
    
    func viewDidLoad()
    func getFollowers()
    func searchBarCancelButtonClicked()
    func updateSearchResults(_ filter: String?)
}
    
protocol FollowersInteractorInterface: AnyObject {
    var output: FollowersInteractorOutput? { get set }
    
    func getFollowers(username: String, paginate: Paginate)
}
    
protocol FollowersInteractorOutput: AnyObject {
    
    func didGetFollowers(_ followers: [Follower])
    func didFailedGetFollowers(_ error: APIError)
    func didCompleteGetFollowers()
}
    
protocol FollowersRouterInterface: AnyObject {
    var viewController: UIViewController? { get set }
    
    func presentAlert(message: String?)

    static func assembleModule(with username: String) -> UIViewController
}

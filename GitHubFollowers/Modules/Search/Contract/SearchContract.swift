//
//  SearchContract.swift
//  GitHubFollowers
//
//  Created by Mohamed Elbana on 3/31/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

protocol SearchView: AnyObject {
    var presenter: SearchPresenterInterface! { get set }
}
    
protocol SearchPresenterInterface: AnyObject {
    var view: SearchView? { get set }
    var router: SearchRouterInterface! { get set }
    var interactor: SearchInteractorInterface! { get set }
    
    func didClickedGetFollowers(_ username: String)
    func presentAlert(_ title: String, _ message: String)
}
    
protocol SearchInteractorInterface: AnyObject {
    var output: SearchInteractorOutput? { get set }
}
    
protocol SearchInteractorOutput: AnyObject {
        
}
    
protocol SearchRouterInterface: AnyObject {
    var viewController: UIViewController? { get set }
    
    func presentFollowers(_ username: String)
    func presentAlert(_ title: String, _ message: String)

    static func assembleModule() -> UIViewController
}

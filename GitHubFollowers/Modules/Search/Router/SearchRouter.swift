//
//  SearchRouter.swift
//  GitHubFollowers
//
//  Created by Mohamed Elbana on 3/31/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

class SearchRouter: SearchRouterInterface {

    weak var viewController: UIViewController?
    
    func presentFollowers(_ username: String) {
        let vc = FollowersRouter.assembleModule(with: username)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func presentAlert(_ title: String, _ message: String) {
        ALERT.show(in: viewController, title: title, message: message)
    }
    
    static func assembleModule() -> UIViewController {
        let view: SearchController = UIStoryboard(name: "Search", bundle: nil).instantiateViewController(withIdentifier: "SearchController") as! SearchController
            
        let presenter = SearchPresenter()
        let interactor = SearchInteractor()
        let router = SearchRouter()
            
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view
        
        let nav = NavController(rootViewController: view)
        return nav
    }
}

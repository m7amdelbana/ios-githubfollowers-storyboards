//
//  FollowersRouter.swift
//  GitHubFollowers
//
//  Created by Mohamed Elbana on 4/8/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

class FollowersRouter: FollowersRouterInterface {

    weak var viewController: UIViewController?
    
    func presentAlert(message: String?) {
        ALERT.show(in: viewController, message: message)
    }

    static func assembleModule(with username: String) -> UIViewController {
        let view: FollowersController = UIStoryboard(name: "Followers", bundle: nil).instantiateViewController(withIdentifier: "FollowersController") as! FollowersController
            
        let presenter = FollowersPresenter()
        let interactor = FollowersInteractor()
        let router = FollowersRouter()
            
        view.presenter = presenter
        presenter.username = username
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view
        
        return view
    }
}

//
//  BaseController.swift
//  GitHubFollowers
//
//  Created by Mohamed Elbana on 3/31/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

class BaseController: UIViewController {
    
    var loading: LoadingController!
    var empty: EmptyScreenController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        loading = LoadingController()
        empty = EmptyScreenController()
    }
    
    func dismissKeyboardTapGesture(view: UIView) {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
}

// MARK: - Loading

extension BaseController {

    func showLoading(in view: UIView) {
        DispatchQueue.main.async {
            self.loading.show(in: view)
        }
    }

    func hideLoading() {
        DispatchQueue.main.async {
            self.loading.close()
        }
    }
}

// MARK: - Empty State

extension BaseController {

    func showEmptyScreen(with message: String, in view: UIView) {
        DispatchQueue.main.async {
            self.empty.message = message
            self.empty.show(in: view)
        }
    }

    func hideEmptyScreen() {
        DispatchQueue.main.async {
            self.empty.close()
        }
    }
}

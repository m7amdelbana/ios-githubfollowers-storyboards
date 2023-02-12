//
//  FollowersController.swift
//  GitHubFollowers
//
//  Created by Mohamed Elbana on 4/4/2020.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

class FollowersController: BaseController {
        
    @IBOutlet weak var collectionView: UICollectionView!
    var searchController = UISearchController()
    
    var presenter: FollowersPresenterInterface!
    
    enum Section {
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    var snapshot: NSDiffableDataSourceSnapshot<Section, Follower>!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}
    
extension FollowersController: FollowersView {
    
    func setupView() {
        configureSearch()
        configureCollection()
        configureDataSource()
    }
    
    func setTitle(_ title: String) {
        self.title = title
    }
    
    func showLoading() {
        showLoading(in: view)
    }
    
    func closeLoading() {
        hideLoading()
    }
    
    func presentEmptyScreen() {
        showEmptyScreen(with: localizedText("empty_followers_message"), in: view)
    }
    
    func closeEmptyScreen() {
        hideEmptyScreen()
    }
}

extension FollowersController: UISearchResultsUpdating, UISearchBarDelegate {

    func configureSearch() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = localizedText("search_for_a_username")
        navigationItem.searchController = searchController
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        presenter.updateSearchResults(searchController.searchBar.text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        presenter.searchBarCancelButtonClicked()
    }
}

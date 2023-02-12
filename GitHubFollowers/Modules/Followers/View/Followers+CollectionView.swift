//
//  Followers+CollectionView.swift
//  GitHubFollowers
//
//  Created by Mohamed Elbana on 4/9/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

extension FollowersController: UICollectionViewDelegate {
    
    func configureCollection() {
        let layout = GridFlowLayout(width: view.bounds.width, columns: 3, padding: 15)
        collectionView.collectionViewLayout = layout
        collectionView.initialize(cellClass: FollowerCell.self, delegate: self)
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            
            let cell = collectionView.dequeue(cellClass: FollowerCell.self, indexPath: indexPath)
            cell.configure(with: follower)
            return cell
        })
    }
    
    func updateUI(on followers: [Follower]) {
        snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            presenter.getFollowers()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let identifier = dataSource.itemIdentifier(for: indexPath) {
            UTIL.openSafari(in: self, with: identifier.htmlUrl)
        }
    }
}


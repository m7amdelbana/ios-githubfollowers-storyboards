//
//  UICollectionView+Extensions.swift
//  GitHubFollowers
//
//  Created by Mohamed Elbana on 3/31/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

typealias UICollectionViewDelegateAndDataSource = UICollectionViewDelegate & UICollectionViewDataSource

extension UICollectionView {
    
    // MARK: Register & Dequeue Cell
    
    func registerCellNib<Cell: UICollectionViewCell>(cellClass: Cell.Type) {
        self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: Cell.self))
    }
    
    func dequeue<Cell: UICollectionViewCell>(cellClass: Cell.Type, indexPath: IndexPath) -> Cell {
        let identifier = String(describing: cellClass.self)
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Cell else {
            fatalError("Error in cell")
        }
        return cell
    }
    
    // MARK: Register & Dequeue Header
    
    func registerHeaderNib<Header: UICollectionReusableView>(headerClass: Header.Type) {
        self.register(UINib(nibName: String(describing: Header.self), bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: Header.self))
    }
    
    func dequeueHeader<Header: UICollectionReusableView>(viewClass: Header.Type, indexPath: IndexPath) -> Header {
        let identifier = String(describing: viewClass.self)
        guard let header = self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: identifier, for: indexPath) as? Header else {
            fatalError("Error in header")
        }
        return header
    }
    
    // MARK: Initialize UICollectionView
    
    func initialize<Cell: UICollectionViewCell>(cellClass: Cell.Type, delegate: UICollectionViewDelegate? = nil, dataSource: UICollectionViewDataSource? = nil) {
        self.registerCellNib(cellClass: cellClass)
        self.delegate = delegate
        self.dataSource = dataSource
    }
}


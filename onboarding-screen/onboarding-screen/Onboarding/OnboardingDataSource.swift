//
//  OnboardingDataSource.swift
//  onboarding-screen
//
//  Created by A23 on 3/5/20.
//  Copyright © 2020 A23. All rights reserved.
//

import UIKit

protocol OnboardingDataSourceProtocol: UICollectionViewDataSource {
    var items: [UIColor] { get }
}

class OnboardingDataSource: NSObject, OnboardingDataSourceProtocol {
    let items: [UIColor] = [.green, .blue, .yellow, .orange, .red]
    private let cellID = "PageCell"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? PageCell else { return UICollectionViewCell() }
        cell.configureCell(item: items[indexPath.item])
        return cell
    }
}

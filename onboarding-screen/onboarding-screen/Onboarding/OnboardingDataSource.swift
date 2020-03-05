//
//  OnboardingDataSource.swift
//  onboarding-screen
//
//  Created by A23 on 3/5/20.
//  Copyright © 2020 A23. All rights reserved.
//

import UIKit

class OnboardingDataSource: NSObject {
    var items: [Page] {
        return DataManager.items
    }
}

extension OnboardingDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // register and dequeue through extension methods
        collectionView.register(nibCell: PageCell.self)
        let cell = collectionView.dequeue(cell: PageCell.self, for: indexPath)
        cell.configure(with: items[indexPath.item])
        return cell
    }
}


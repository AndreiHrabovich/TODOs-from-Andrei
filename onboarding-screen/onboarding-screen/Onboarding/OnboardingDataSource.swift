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
        #warning("TODO - consider using info source manager")
        
        return [
            Page(headlineText: "Step 1", captionText: "Caption 1"),
            Page(headlineText: "Step 2", captionText: "Caption 2"),
            Page(headlineText: "Step 3", captionText: "Caption 3"),
            Page(headlineText: "Step 4", captionText: "Caption 4"),
            Page(headlineText: "Step 5", captionText: "Caption 5")
        ]
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


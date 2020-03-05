//
//  OnboardingDataSource.swift
//  onboarding-screen
//
//  Created by A23 on 3/5/20.
//  Copyright © 2020 A23. All rights reserved.
//

import UIKit

protocol OnboardingDataSourceProtocol: UICollectionViewDataSource {
    var items: [Page] { get }
}

class OnboardingDataSource: NSObject, OnboardingDataSourceProtocol {
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
    
    #warning("TODO - use R.swift or class subscript")
    private let cellID = "PageCell"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? PageCell else { return UICollectionViewCell() }
        cell.configure(with: items[indexPath.item])
        return cell
    }
}

//
//  OnboardingViewController.swift
//  onboarding-screen
//
//  Created by A23 on 3/4/20.
//  Copyright © 2020 A23. All rights reserved.
//

import UIKit

final class OnboardingViewController: UIViewController {
    // MARK: - Properties
    
    #warning("TODO - to use R.swift instead")
    private let cellID = "PageCell"
    private let colors: [UIColor] = [.green, .blue, .yellow, .orange, .red]
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var layout: UICollectionViewFlowLayout!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupCOllectionView() {
//        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true // to enable paging
        layout.scrollDirection = .horizontal
    }
}

#warning("TODO - to extract delegate and data source to a standalone entity")
// MARK: - UICollectionViewDataSource

extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? PageCell else { return UICollectionViewCell() }
        let color = colors[indexPath.item]
        cell.backgroundColor = color
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
}

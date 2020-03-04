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
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var skipButton: UIButton!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    internal func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        pageControl.currentPage = Int(targetContentOffset.pointee.x / collectionView.frame.width)
        // USE collectionView.frame.width because it can be of different value and it directly affects the calculation
        // probably that's the place to change the button from Skip to Start when reaching the last page
        handleSkipButtonAppearance()
    }
    
    // MARK: - IBActions
    
    @IBAction private func skipButtonTapped(_ sender: UIButton) {
        // move to the main VC
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = mainStoryboard.instantiateViewController(identifier: "MainVC") // if that's the only vc in the storyboard, can we do without identifier (Storyboard ID) ?
        mainVC.modalPresentationStyle = .fullScreen
        present(mainVC, animated: true, completion: nil)
        #warning("TODO - to figure out how to dismiss the onboarding vc after navigating to the main vc")
    }
    
    // MARK: - Helpers
    
    private func setupUI() {
        collectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        collectionView.delegate = self // is needed anyways (without it the cells don't scale properly)
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true // to enable paging
        layout.scrollDirection = .horizontal
    
        pageControl.numberOfPages = colors.count
        skipButton.setTitle("Skip", for: .normal)
        #warning("TODO - page control customization (color etc.)")
    }
    
    private func handleSkipButtonAppearance () {
        if pageControl.currentPage == (colors.count - 1) { // because the array starts from 0
            skipButton.setTitle("Start", for: .normal)
        } else {
            skipButton.setTitle("Skip", for: .normal)
        }
        
        print("Current Page: ", pageControl.currentPage)
    }
}

#warning("TODO - to extract delegate and data source to a standalone entity")
// MARK: - UICollectionViewDataSource

extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.size.width
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0 // need to overrride this bacause it will add 5 or 10 by default
    }
}

#warning("TODO - to figure out how to avoid showing this thing every time, should work only for the first time")
#warning("TODO - to find out whether it's possible to use the page control to navigate the onboarding screen")
#warning("TODO - a separate branch with comments left")

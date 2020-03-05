//
//  OnboardingViewController.swift
//  onboarding-screen
//
//  Created by A23 on 3/4/20.
//  Copyright © 2020 A23. All rights reserved.
//

import UIKit

final class OnboardingViewController: UIViewController {
    enum LayoutConstants {
        static let padding: CGFloat = .zero // - 7
        static let sectionInset: UIEdgeInsets = .zero // - 7
    }
    
    // MARK: - Properties
    
    #warning("TODO - to use R.swift instead")
    private let cellID = "PageCell"
    private let colors: [UIColor] = [.green, .blue, .yellow, .orange, .red]
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var skipButton: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = collectionView.frame.size

            layout.minimumInteritemSpacing = LayoutConstants.padding
            layout.minimumLineSpacing = LayoutConstants.padding
            layout.sectionInset = LayoutConstants.sectionInset
            layout.scrollDirection = .horizontal
        }
//        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    // MARK: - IBActions
    
    @IBAction private func skipButtonTapped(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let mainVC = mainStoryboard.instantiateViewController(withIdentifier: "MainVC") as? MainViewController else { return } // 3 and 4
        
        switchRootViewController(rootViewController: mainVC, animated: true, completion: nil)
    }
    
    // MARK: - Helpers
    
    private func setupUI() {
        collectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        collectionView.delegate = self as UICollectionViewDelegate // - 5
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        
        pageControl.numberOfPages = colors.count
        skipButton.setTitle("Skip", for: .normal)
        #warning("TODO - page control customization (color etc.)")
    }
    
    private func handleSkipButtonAppearance () {
        if pageControl.currentPage == (colors.count - 1) { // - 6
            skipButton.setTitle("Start", for: .normal)
        } else {
            skipButton.setTitle("Skip", for: .normal)
        }
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
        #warning("TODO - configure cell in the Page Cell")
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / collectionView.frame.size.width) // - 1
        handleSkipButtonAppearance() // - 2
    }
    
    // can do without these methods exention by setting the properties directly
    // but if different cells have different cises, use the delegate

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // - 7
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let height = collectionView.frame.size.height
//        let width = collectionView.frame.size.width
//        return CGSize(width: width, height: height)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0 // - 7
//    }
    
}

#warning("TODO - to figure out how to avoid showing this thing every time, should work only for the first time")
#warning("TODO - to find out whether it's possible to use the page control to navigate the onboarding screen")
#warning("TODO - a separate branch with comments left")
#warning("To deploy to a real device wirelessly, make sure the Mac and the iOS device are connected to the same network, otherwise use TestFlight")

/*
 Comments:
 
 1 - USE collectionView.frame.width because it can be of different value and it directly affects the calculation
 2 - Probably that's the place to change the button from Skip to Start when reaching the last page
 3 - STORYBOARD.instantiateViewController(identifier: "MainVC") - available only in iOS13
 4 - If that's the only vc in the storyboard, can we do without identifier (Storyboard ID) ?
 5 - The delegate is needed anyways (without it the cells don't scale properly)
 6 - Because the array starts from 0
 7 - Returning 0 (or better .zero) is need to overrride this bacause it will add 5 or 10 by default
 */

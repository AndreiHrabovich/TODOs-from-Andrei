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
        static let padding: CGFloat = .zero
        static let sectionInset: UIEdgeInsets = .zero
    }
    
    // MARK: - Properties
    
    var onboardingDataSource = OnboardingDataSource()
    var pageCount: Int {
        return onboardingDataSource.items.count
    }
//    weak var appDelegate = UIApplication.shared.delegate as? AppDelegate
    // can do withou it if we call the app cache singleton directly

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
        guard let mainVC = mainStoryboard.instantiateViewController(withIdentifier: "MainVC") as? MainViewController else { return }
    
//        appDelegate?.appCache.shouldSkipToMain = true
        // can do withou it if we call the app cache singleton directly
        AppCache.shared.shouldSkipToMain = true
        switchRootViewController(rootViewController: mainVC, animated: true, completion: nil)
    }
    
    // MARK: - Helpers
    
    private func setupUI() {
        collectionView.delegate = self as UICollectionViewDelegate
        collectionView.dataSource = onboardingDataSource
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        setPageControl(numberOfPages: pageCount)
        setSkipButton(title: "Skip", titleColor: .systemGray, bgColor: .clear)
    }
    
    private func handleSkipButtonAppearance () {
        if pageControl.currentPage == (pageCount) - 1 {
            setSkipButton(title: "Start", titleColor: .white, bgColor: .systemRed)
        } else {
            setSkipButton(title: "Skip", titleColor: .systemGray, bgColor: .clear)
        }
    }
    
    private func setSkipButton(title: String, titleColor: UIColor, bgColor: UIColor) {
        skipButton.setTitle(title, for: .normal)
        skipButton.backgroundColor = bgColor
        skipButton.setTitleColor(titleColor, for: .normal)
        skipButton.layer.cornerRadius = 5
    }
    
    private func setPageControl(numberOfPages: Int) {
        pageControl.numberOfPages = numberOfPages
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / collectionView.frame.size.width)
        handleSkipButtonAppearance()
    }
}

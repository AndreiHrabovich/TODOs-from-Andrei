//
//  OnboardingViewController.swift
//  onboarding-screen
//
//  Created by A23 on 3/4/20.
//  Copyright © 2020 A23. All rights reserved.
//

import UIKit

final class OnboardingViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var layout: UICollectionViewFlowLayout!
    
    let cellID = "PageCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//
//  UICollectionView + Extension.swift
//  onboarding-screen
//
//  Created by A23 on 3/5/20.
//  Copyright © 2020 A23. All rights reserved.
//

import UIKit
extension UICollectionView {
    func dequeue <T: UICollectionViewCell>(cell identifier: T.Type, for indexPath: IndexPath) -> T {
        let identifierString = String(describing: identifier)
        return dequeueReusableCell(withReuseIdentifier: identifierString, for: indexPath) as! T
    }
    
    func dequeue <T: UICollectionReusableView>(supplementaryView identifier: T.Type, kind: String, for indexPath: IndexPath) -> T {
        let identifierString = String(describing: identifier)
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: identifierString, for: indexPath) as! T
    }
}

extension UICollectionView {
    func register <T: UICollectionViewCell>(nibCell identifier: T.Type) {
        let identifierString = String(describing: identifier)
        let nib = UINib(nibName: identifierString, bundle: nil)
        register(nib, forCellWithReuseIdentifier: identifierString)
    }
    
    func register <T: UICollectionReusableView>(nibSupplementaryView identifier: T.Type, kind: String) {
        let identifierString = String(describing: identifier)
        let nib = UINib(nibName: identifierString, bundle: nil)
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifierString)
    }
}

// these are to reqister and dequeue cells through subscripts
#warning("TODO - learn more about these")

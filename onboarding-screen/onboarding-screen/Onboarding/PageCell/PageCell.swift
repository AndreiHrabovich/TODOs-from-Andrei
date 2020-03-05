//
//  PageCell.swift
//  onboarding-screen
//
//  Created by A23 on 3/4/20.
//  Copyright © 2020 A23. All rights reserved.
//

import UIKit

final class PageCell: UICollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(item: UIColor) {
        backgroundColor = item
    }
}

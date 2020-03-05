//
//  PageCell.swift
//  onboarding-screen
//
//  Created by A23 on 3/4/20.
//  Copyright © 2020 A23. All rights reserved.
//

import UIKit

final class PageCell: UICollectionViewCell {
    @IBOutlet private weak var headlineText: UILabel!
    @IBOutlet private weak var captionText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with item: Page) {
        headlineText.text = item.headlineText
        captionText.text = item.captionText
    }
}

// in xib files, you need to add a view (as a container, if there no such one) before adding a stack view and lables inside

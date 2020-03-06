//
//  DataManager.swift
//  onboarding-screen
//
//  Created by A23 on 3/5/20.
//  Copyright © 2020 A23. All rights reserved.
//

import Foundation

final class DataManager {
    static var items: [Page] {        
        return [
            Page(headlineText: "Step 1", captionText: "Caption 1"),
            Page(headlineText: "Step 2", captionText: "Caption 2"),
            Page(headlineText: "Step 3", captionText: "Caption 3"),
            Page(headlineText: "Step 4", captionText: "Caption 4"),
            Page(headlineText: "Step 5", captionText: "Caption 5")
        ]
    }
}

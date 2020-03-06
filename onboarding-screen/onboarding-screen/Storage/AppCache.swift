//
//  AppCache.swift
//  onboarding-screen
//
//  Created by A23 on 3/6/20.
//  Copyright © 2020 A23. All rights reserved.
//

import Foundation

class AppCache {
    private let userDefaults = UserDefaults.standard
    private let flagKey = "isOnboardingRequired"
    var isOnboardingRequired: Bool {
//        didSet(flag) {
//            userDefaults.set(flag, forKey: "isOnboardingRequired")
//        }
        get {
            return (userDefaults.object(forKey: flagKey) != nil)
        }
        
        set(flag) {
            userDefaults.set(flag, forKey: flagKey)
        }
    }
}

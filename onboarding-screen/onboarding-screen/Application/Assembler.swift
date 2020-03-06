//
//  Assembler.swift
//  onboarding-screen
//
//  Created by A23 on 3/6/20.
//  Copyright © 2020 A23. All rights reserved.
//

import UIKit

final class Assembler {
    static func assembleRootVC(withFlag flag: Bool) -> UIViewController {
        let onboardingVC = UIStoryboard(name: "Onboarding", bundle: nil)
            .instantiateViewController(withIdentifier: "OnboardingVC")
        let mainVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "MainVC")
        
        return !flag ? onboardingVC : mainVC
    }
}

//
//  UIColor+Utils.swift
//  won-iOS
//
//  Created by Elly Richardson on 2/2/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import UIKit
import SwiftEntryKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    static let dimmedDarkBackground = UIColor(white: 50.0/255.0, alpha: 0.3)
    static let dimmedDarkestBackground = UIColor(white: 0, alpha: 0.5)
    static let musicRedish = UIColor(red: 219, green: 58, blue: 94)
}

extension EKColor {
    static var dimmedDarkBackground: EKColor {
        return EKColor(light: .dimmedDarkBackground,
                       dark: .dimmedDarkestBackground)
    }
    
    static var navigationItemColor: EKColor {
        return EKColor(light: .gray,
                       dark: .musicRedish)
    }
}




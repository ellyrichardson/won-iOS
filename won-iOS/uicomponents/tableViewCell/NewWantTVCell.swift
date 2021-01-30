//
//  NewWantTVCell.swift
//  won-iOS
//
//  Created by Elly Richardson on 1/22/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import UIKit

class NewWantTVCell: UITableViewCell {
    override func awakeFromNib() {
        
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = 8
        self.contentView.backgroundColor = UIColor(named: "won-light-orange")

        self.layer.backgroundColor = UIColor.clear.cgColor
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.3
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.y += 4
            frame.size.height -= 2 * 5
            super.frame = frame
        }
    }
}

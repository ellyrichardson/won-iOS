//
//  WantTVCell.swift
//  won-iOS
//
//  Created by Elly Richardson on 11/21/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import UIKit

class WantTVCell: UITableViewCell {
    
    @IBOutlet weak var wantName: UILabel!
    @IBOutlet weak var timeLeftLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var wantImage: UIImageView!
    
    override func awakeFromNib() {
        prepareImage()
        
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = 8

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
    
    func prepareImage() {
        wantImage.layer.cornerRadius = wantImage.frame.size.width/2.3704
        wantImage.clipsToBounds = true
        wantImage.layer.borderWidth = 2.0
        wantImage.layer.borderColor = UIColor.white.cgColor
    }
}

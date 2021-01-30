//
//  WantDetailsTVCell.swift
//  won-iOS
//
//  Created by Elly Richardson on 1/23/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import UIKit

class OvalButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    
    func setupButton() {
        setTitleColor(.white, for: .normal)
        
        backgroundColor = UIColor(named: "won-dark-blue")
        titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 13)
        layer.cornerRadius = 15.0
        layer.borderWidth = 3.0
        layer.borderColor = UIColor.clear.cgColor
    }
    
    
    func shake() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 8, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 8, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
}

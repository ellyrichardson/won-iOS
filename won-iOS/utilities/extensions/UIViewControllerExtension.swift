//
//  UIViewControllerExtension.swift
//  won-iOS
//
//  Created by Elly Richardson on 3/7/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}

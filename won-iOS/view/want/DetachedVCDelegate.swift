//
//  DetachedVCDelegate.swift
//  won-iOS
//
//  Created by Elly Richardson on 2/3/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import UIKit

/*
 NOTE: Make this protocol be generic, and have other detachedVCDelegates inherit from this
 */
protocol DetachedVCDelegate: class {
    func action(sender: Any)
}

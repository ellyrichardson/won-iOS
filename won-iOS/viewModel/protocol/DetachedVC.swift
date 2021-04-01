//
//  DetachedVC.swift
//  won-iOS
//
//  Created by Elly Richardson on 3/31/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

protocol DetachedVC {
    func setDetachedVCDelegate(delegate: DetachedVCDelegate)
    func getDetachedVCDelegate() -> DetachedVCDelegate
}

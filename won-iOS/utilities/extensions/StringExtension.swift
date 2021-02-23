//
//  StringExtension.swift
//  won-iOS
//
//  Created by Elly Richardson on 2/23/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import Foundation

extension String {
    var isNumeric : Bool {
        return Double(self) != nil
    }
}

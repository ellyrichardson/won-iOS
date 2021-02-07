//
//  SEKPresetDescription.swift
//  won-iOS
//
//  Created by Elly Richardson on 2/2/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import SwiftEntryKit

struct PresetDescription {
    let title: String
    let description: String
    let thumb: String
    let attributes: EKAttributes
    
    init(with attributes: EKAttributes, title: String, description: String = "", thumb: String) {
        self.attributes = attributes
        self.title = title
        self.description = description
        self.thumb = thumb
    }
}

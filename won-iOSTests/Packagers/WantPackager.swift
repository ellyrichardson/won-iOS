//
//  WantPackager.swift
//  won-iOSTests
//
//  Created by Elly Richardson on 3/9/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import Foundation

@testable import won_iOS

class WantPackager {
    static func packageAsSimpleWith15DaysLeft() -> Want {
        let builder = WantBuilder()
        return builder.withName(name: "TestWant1")
            .withId(id: "unique1")
            .withOwner(owner: "testOwner")
            .withNotes(notes: "testNotes")
            .withPoints(points: 78)
            .withObtained(obtained: false)
            .withDaysLeft(daysLeft: 15)
            .build()
    }
    
    static func packageAsSimpleWithUnspecifiedDaysLeft() -> Want {
        let builder = WantBuilder()
        return builder.withName(name: "TestWant1")
            .withId(id: "unique1")
            .withOwner(owner: "testOwner")
            .withNotes(notes: "testNotes")
            .withPoints(points: 78)
            .withObtained(obtained: false)
            .build()
    }
    
    static func packageAsSimpleWith30DaysLeft() -> Want {
        let builder = WantBuilder()
        return builder.withName(name: "TestWant1")
            .withId(id: "unique1")
            .withOwner(owner: "testOwner")
            .withNotes(notes: "testNotes")
            .withPoints(points: 78)
            .withObtained(obtained: false)
            .withDaysLeft(daysLeft: 30)
            .build()
    }
}

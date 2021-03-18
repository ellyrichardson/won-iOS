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
            .withOwner(owner: "testOwner")
            .withNotes(notes: "testNotes")
            .withPoints(points: 78)
            .withObtained(obtained: false)
            .build()
    }
    
    static func packageAsSimpleWith30DaysLeft() -> Want {
        let builder = WantBuilder()
        return builder.withName(name: "TestWant1")
            .withOwner(owner: "testOwner")
            .withNotes(notes: "testNotes")
            .withPoints(points: 78)
            .withObtained(obtained: false)
            .withDaysLeft(daysLeft: 30)
            .build()
    }
    
    static func packageWithDateString(dateString: String) -> Want {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let dateTime = formatter.date(from: dateString)
        
        let builder = WantBuilder()
        return builder.withName(name: "TestWant1")
            .withOwner(owner: "testOwner")
            .withNotes(notes: "testNotes")
            .withPoints(points: 78)
            .withObtained(obtained: false)
            .withDaysLeft(daysLeft: 30)
            .withDateCreated(dateCreated: dateTime!)
            .build()
    }
    
    static func packageWithInterestPoints(interestPoints: Int) -> Want {
        let builder = WantBuilder()
        return builder.withName(name: "TestWant1")
            .withOwner(owner: "testOwner")
            .withNotes(notes: "testNotes")
            .withObtained(obtained: false)
            .withDaysLeft(daysLeft: 30)
            .withPoints(points: interestPoints)
            .build()
    }
    
    static func packageWithName(name: String) -> Want {
        let builder = WantBuilder()
        return builder.withName(name: name)
            .withOwner(owner: "testOwner")
            .withNotes(notes: "testNotes")
            .withPoints(points: 78)
            .withObtained(obtained: false)
            .withDaysLeft(daysLeft: 30)
            .build()
    }
    
    static func packageAsSimpleWithNotification() -> Want {
        let notificationBuilder = WantNotificationBuilder()
        let wantNotif = notificationBuilder.withDaysLeft(daysLeft: 30)
            .withNotifying(notifying: false)
            .withRepeating(repeating: false)
            .build()
        let builder = WantBuilder()
        return builder.withName(name: "TestWant1")
            .withOwner(owner: "testOwner")
            .withNotes(notes: "testNotes")
            .withPoints(points: 78)
            .withObtained(obtained: false)
            .withNotification(notification: wantNotif)
            .build()
    }
}

//
//  WantBuilder.swift
//  won-iOS
//
//  Created by Elly Richardson on 11/21/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import Foundation

class WantBuilder {
    private var want: Want
    
    init() {
        self.want = Want()
    }
    
    func withId(id: String) -> WantBuilder {
        want.setId(id: id)
        return self
    }
    
    func withOwner(owner: String) -> WantBuilder {
        want.setOwner(owner: owner)
        return self
    }
    
    func withName(name: String) -> WantBuilder {
        want.setName(name: name)
        return self
    }
    
    func withPoints(points: Int) -> WantBuilder {
        want.setPoints(points: points)
        return self
    }
    
    func withNotes(notes: String) -> WantBuilder {
        want.setNotes(notes: notes)
        return self
    }
    
    func withImageName(imageName: String) -> WantBuilder {
        want.setImageName(imageName: imageName)
        return self
    }
    
    func withDaysLeft(daysLeft: Int) -> WantBuilder {
        want.setDaysLeft(daysLeft: daysLeft)
        return self
    }
    
    func withSocialStatus(socialStatus: WantSocialStatus) -> WantBuilder {
        want.setSocialStatus(socialStatus: socialStatus)
        return self
    }
    
    /*
    func withHistory(history: WantHistory) -> WantBuilder {
        want.setHistory(history: history)
        return self
    }*/
    
    func withObtained(obtained: Bool) -> WantBuilder {
        want.setObtained(obtained: obtained)
        return self
    }
    
    func withObtainedDate(obtainedDate: Date) -> WantBuilder {
        want.setObtainedDate(obtainedDate: obtainedDate)
        return self
    }
    
    func withDateCreated(dateCreated: Date) -> WantBuilder {
        want.setDateCreated(dateCreated: dateCreated)
        return self
    }
    
    func withDateModified(dateModified: Date) -> WantBuilder {
        want.setDateModified(dateModified: dateModified)
        return self
    }
    
    func build() -> Want {
        return want
    }
}

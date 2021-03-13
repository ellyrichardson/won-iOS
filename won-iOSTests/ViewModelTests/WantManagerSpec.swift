//
//  WantManagerSpecs.swift
//  won-iOSTests
//
//  Created by Elly Richardson on 3/7/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import Quick
import Nimble
import RealmSwift
@testable import won_iOS

class WantManagerSpec: QuickSpec {
    override func spec() {
        
        describe("Want Manager") {
            context("days left assigner") {
                
                beforeSuite {
                    Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
                }
                
                beforeEach {
                    let realm = try! Realm()
                    try! realm.write {
                        realm.deleteAll()
                    }
                }
                
                it("should return 30 days left if Want has wrong days left") {
                    // SETUP Area
                    let want = WantPackager.packageAsSimpleWith15DaysLeft()
                    let wantManager = WantManager()
                    let expectedDaysLeft = 30
                    let realm = try! Realm()
                    try! realm.write {
                        realm.add(want)
                    }
                    // RUN area
                    wantManager.runWantsDaysLeftCheck()
                    // ASSERTION area
                    let wantFromDB = realm.objects(Want.self).last
                    expect(wantFromDB?.daysLeft).to(be(expectedDaysLeft))
                }
                
                it("should return 30 daysLeft if daysLeft is 30 in Want") {
                    // SETUP Area
                    let want = WantPackager.packageAsSimpleWith30DaysLeft()
                    let wantManager = WantManager()
                    let expectedDaysLeft = 30
                    let realm = try! Realm()
                    try! realm.write {
                        realm.add(want)
                    }
                    // RUN area
                    wantManager.runWantsDaysLeftCheck()
                    // ASSERTION area
                    let wantFromDB = realm.objects(Want.self).last
                    expect(wantFromDB?.daysLeft).to(be(expectedDaysLeft))
                }
                
                it("should return 0 daysLeft if daysLeft is not initially assigned in Want") {
                    // SETUP Area
                    let want = WantPackager.packageAsSimpleWithUnspecifiedDaysLeft()
                    let wantManager = WantManager()
                    let realm = try! Realm()
                    try! realm.write {
                        realm.add(want)
                    }
                    // RUN area
                    wantManager.runWantsDaysLeftCheck()
                    // ASSERTION area
                    let wantFromDB = realm.objects(Want.self).last
                    expect(wantFromDB?.daysLeft).to(be(0))
                }
            }
        }
    }
}

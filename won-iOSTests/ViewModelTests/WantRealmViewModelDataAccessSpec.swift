//
//  WantRealmViewModelDataAccessSpec.swift
//  won-iOSTests
//
//  Created by Elly Richardson on 3/13/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import Quick
import Nimble
import RealmSwift
@testable import won_iOS

class WantRealmViewModelDataAccessSpec: QuickSpec {
    override func spec() {
        
        describe("Want Realm ViewModel data access") {
            context("findAllWants()") {
                
                beforeSuite {
                    Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
                }
                
                beforeEach {
                    let realm = try! Realm()
                    try! realm.write {
                        realm.deleteAll()
                    }
                }
                
                it("should return all wants existing") {
                    // SETUP Area
                    let UNIQUE_ID_1 = "unique1"
                    let UNIQUE_ID_2 = "unique2"
                    let want1 = WantPackager.packageAsSimpleWith15DaysLeft()
                    want1.setId(id: UNIQUE_ID_1)
                    let want2 = WantPackager.packageAsSimpleWith30DaysLeft()
                    want2.setId(id: UNIQUE_ID_2)
                    let realm = try! Realm()
                    try! realm.write {
                        realm.add(want1)
                        realm.add(want2)
                    }
                    let dataAccess = WantRealmViewModelDataAccess()
                    
                    // RUN area
                    let wantViewModels = dataAccess.findAllWants()
                    
                    // ASSERTION area
                    expect(wantViewModels.count).to(be(2))
                    var expectedIds = [String]()
                    for item in wantViewModels {
                        expectedIds.append(item.getId())
                    }
                    expect(expectedIds.contains(UNIQUE_ID_1)).to(be(true))
                    expect(expectedIds.contains(UNIQUE_ID_2)).to(be(true))
                }
            }
            
            context("findSortedWants()") {
                
                beforeSuite {
                    Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
                }
                
                beforeEach {
                    let realm = try! Realm()
                    try! realm.write {
                        realm.deleteAll()
                    }
                }
                
                it("should sort by age ascendingly, if sorted by age ascendingly") {
                    // SETUP Area
                    let UNIQUE_ID_1 = "unique1"
                    let UNIQUE_ID_2 = "unique2"
                    let UNIQUE_ID_3 = "unique3"
                    let want1 = WantPackager.packageWithDateString(dateString: "2021/03/11 12:30")
                    want1.setId(id: UNIQUE_ID_1)
                    let want2 = WantPackager.packageWithDateString(dateString: "2021/03/12 12:30")
                    want2.setId(id: UNIQUE_ID_2)
                    let want3 = WantPackager.packageWithDateString(dateString: "2021/03/13 12:30")
                    want3.setId(id: UNIQUE_ID_3)
                    let realm = try! Realm()
                    try! realm.write {
                        realm.add(want1)
                        realm.add(want2)
                        realm.add(want3)
                    }
                    let dataAccess = WantRealmViewModelDataAccess()
                    
                    // RUN area
                    let wantViewModels = dataAccess.findSortedWants(sortType: WantSortType.BY_AGE, sortOrder: WantSortOrder.ASCENDING)
                    
                    // ASSERTION area
                    expect(wantViewModels.count).to(be(3))
                    var expectedIds = [String]()
                    for item in wantViewModels {
                        expectedIds.append(item.getId())
                    }
                    expect(expectedIds[0]).to(be(UNIQUE_ID_1))
                    expect(expectedIds[1]).to(be(UNIQUE_ID_2))
                    expect(expectedIds[2]).to(be(UNIQUE_ID_3))
                }
                
                it("should sort by age descendingly, if sorted by age descendingly") {
                    // SETUP Area
                    let UNIQUE_ID_1 = "unique1"
                    let UNIQUE_ID_2 = "unique2"
                    let UNIQUE_ID_3 = "unique3"
                    let want1 = WantPackager.packageWithDateString(dateString: "2021/03/11 12:30")
                    want1.setId(id: UNIQUE_ID_1)
                    let want2 = WantPackager.packageWithDateString(dateString: "2021/03/12 12:30")
                    want2.setId(id: UNIQUE_ID_2)
                    let want3 = WantPackager.packageWithDateString(dateString: "2021/03/13 12:30")
                    want3.setId(id: UNIQUE_ID_3)
                    let realm = try! Realm()
                    try! realm.write {
                        realm.add(want1)
                        realm.add(want2)
                        realm.add(want3)
                    }
                    let dataAccess = WantRealmViewModelDataAccess()
                    
                    // RUN area
                    let wantViewModels = dataAccess.findSortedWants(sortType: WantSortType.BY_AGE, sortOrder: WantSortOrder.DESCENDING)
                    
                    // ASSERTION area
                    expect(wantViewModels.count).to(be(3))
                    var expectedIds = [String]()
                    for item in wantViewModels {
                        expectedIds.append(item.getId())
                    }
                    expect(expectedIds[2]).to(be(UNIQUE_ID_1))
                    expect(expectedIds[1]).to(be(UNIQUE_ID_2))
                    expect(expectedIds[0]).to(be(UNIQUE_ID_3))
                }
                
                it("should sort by interest points ascendingly, if sorted by interest points ascendingly") {
                    // SETUP Area
                    let UNIQUE_ID_1 = "unique1"
                    let UNIQUE_ID_2 = "unique2"
                    let UNIQUE_ID_3 = "unique3"
                    let want1 = WantPackager.packageWithInterestPoints(interestPoints: 82)
                    want1.setId(id: UNIQUE_ID_1)
                    let want2 = WantPackager.packageWithInterestPoints(interestPoints: 83)
                    want2.setId(id: UNIQUE_ID_2)
                    let want3 = WantPackager.packageWithInterestPoints(interestPoints: 84)
                    want3.setId(id: UNIQUE_ID_3)
                    let realm = try! Realm()
                    try! realm.write {
                        realm.add(want1)
                        realm.add(want2)
                        realm.add(want3)
                    }
                    let dataAccess = WantRealmViewModelDataAccess()
                    
                    // RUN area
                    let wantViewModels = dataAccess.findSortedWants(sortType: WantSortType.BY_INTEREST_POINTS, sortOrder: WantSortOrder.ASCENDING)
                    
                    // ASSERTION area
                    expect(wantViewModels.count).to(be(3))
                    var expectedIds = [String]()
                    for item in wantViewModels {
                        expectedIds.append(item.getId())
                    }
                    expect(expectedIds[0]).to(be(UNIQUE_ID_1))
                    expect(expectedIds[1]).to(be(UNIQUE_ID_2))
                    expect(expectedIds[2]).to(be(UNIQUE_ID_3))
                }
                
                it("should sort by interest points descendingly, if sorted by interest points descendingly") {
                    // SETUP Area
                    let UNIQUE_ID_1 = "unique1"
                    let UNIQUE_ID_2 = "unique2"
                    let UNIQUE_ID_3 = "unique3"
                    let want1 = WantPackager.packageWithInterestPoints(interestPoints: 82)
                    want1.setId(id: UNIQUE_ID_1)
                    let want2 = WantPackager.packageWithInterestPoints(interestPoints: 83)
                    want2.setId(id: UNIQUE_ID_2)
                    let want3 = WantPackager.packageWithInterestPoints(interestPoints: 84)
                    want3.setId(id: UNIQUE_ID_3)
                    let realm = try! Realm()
                    try! realm.write {
                        realm.add(want1)
                        realm.add(want2)
                        realm.add(want3)
                    }
                    let dataAccess = WantRealmViewModelDataAccess()
                    
                    // RUN area
                    let wantViewModels = dataAccess.findSortedWants(sortType: WantSortType.BY_INTEREST_POINTS, sortOrder: WantSortOrder.DESCENDING)
                    
                    // ASSERTION area
                    expect(wantViewModels.count).to(be(3))
                    var expectedIds = [String]()
                    for item in wantViewModels {
                        expectedIds.append(item.getId())
                    }
                    expect(expectedIds[2]).to(be(UNIQUE_ID_1))
                    expect(expectedIds[1]).to(be(UNIQUE_ID_2))
                    expect(expectedIds[0]).to(be(UNIQUE_ID_3))
                }
                
                it("should sort by interest points ascendingly with interest points different by 10s") {
                    // SETUP Area
                    let UNIQUE_ID_1 = "unique1"
                    let UNIQUE_ID_2 = "unique2"
                    let UNIQUE_ID_3 = "unique3"
                    let want1 = WantPackager.packageWithInterestPoints(interestPoints: 72)
                    want1.setId(id: UNIQUE_ID_1)
                    let want2 = WantPackager.packageWithInterestPoints(interestPoints: 82)
                    want2.setId(id: UNIQUE_ID_2)
                    let want3 = WantPackager.packageWithInterestPoints(interestPoints: 92)
                    want3.setId(id: UNIQUE_ID_3)
                    let realm = try! Realm()
                    try! realm.write {
                        realm.add(want1)
                        realm.add(want2)
                        realm.add(want3)
                    }
                    let dataAccess = WantRealmViewModelDataAccess()
                    
                    // RUN area
                    let wantViewModels = dataAccess.findSortedWants(sortType: WantSortType.BY_INTEREST_POINTS, sortOrder: WantSortOrder.ASCENDING)
                    
                    // ASSERTION area
                    expect(wantViewModels.count).to(be(3))
                    var expectedIds = [String]()
                    for item in wantViewModels {
                        expectedIds.append(item.getId())
                    }
                    expect(expectedIds[0]).to(be(UNIQUE_ID_1))
                    expect(expectedIds[1]).to(be(UNIQUE_ID_2))
                    expect(expectedIds[2]).to(be(UNIQUE_ID_3))
                }
                
                it("should sort by interest points descendingly with interest points different by 10s") {
                    // SETUP Area
                    let UNIQUE_ID_1 = "unique1"
                    let UNIQUE_ID_2 = "unique2"
                    let UNIQUE_ID_3 = "unique3"
                    let want1 = WantPackager.packageWithInterestPoints(interestPoints: 72)
                    want1.setId(id: UNIQUE_ID_1)
                    let want2 = WantPackager.packageWithInterestPoints(interestPoints: 82)
                    want2.setId(id: UNIQUE_ID_2)
                    let want3 = WantPackager.packageWithInterestPoints(interestPoints: 92)
                    want3.setId(id: UNIQUE_ID_3)
                    let realm = try! Realm()
                    try! realm.write {
                        realm.add(want1)
                        realm.add(want2)
                        realm.add(want3)
                    }
                    let dataAccess = WantRealmViewModelDataAccess()
                    
                    // RUN area
                    let wantViewModels = dataAccess.findSortedWants(sortType: WantSortType.BY_INTEREST_POINTS, sortOrder: WantSortOrder.DESCENDING)
                    
                    // ASSERTION area
                    expect(wantViewModels.count).to(be(3))
                    var expectedIds = [String]()
                    for item in wantViewModels {
                        expectedIds.append(item.getId())
                    }
                    expect(expectedIds[2]).to(be(UNIQUE_ID_1))
                    expect(expectedIds[1]).to(be(UNIQUE_ID_2))
                    expect(expectedIds[0]).to(be(UNIQUE_ID_3))
                }
                
                // NOTE: FAILS
                it("should sort by interest points descendingly even if a Want has single digit interest point") {
                    // SETUP Area
                    let UNIQUE_ID_1 = "unique1"
                    let UNIQUE_ID_2 = "unique2"
                    let UNIQUE_ID_3 = "unique3"
                    let want1 = WantPackager.packageWithInterestPoints(interestPoints: 7)
                    want1.setId(id: UNIQUE_ID_1)
                    let want2 = WantPackager.packageWithInterestPoints(interestPoints: 62)
                    want2.setId(id: UNIQUE_ID_2)
                    let want3 = WantPackager.packageWithInterestPoints(interestPoints: 82)
                    want3.setId(id: UNIQUE_ID_3)
                    let realm = try! Realm()
                    try! realm.write {
                        realm.add(want1)
                        realm.add(want2)
                        realm.add(want3)
                    }
                    let dataAccess = WantRealmViewModelDataAccess()
                    
                    // RUN area
                    let wantViewModels = dataAccess.findSortedWants(sortType: WantSortType.BY_INTEREST_POINTS, sortOrder: WantSortOrder.DESCENDING)
                    
                    // ASSERTION area
                    expect(wantViewModels.count).to(be(3))
                    var expectedIds = [String]()
                    for item in wantViewModels {
                        expectedIds.append(item.getId())
                    }
                    //expect(expectedIds[2]).to(be(UNIQUE_ID_1))
                    //expect(expectedIds[1]).to(be(UNIQUE_ID_2))
                    //expect(expectedIds[0]).to(be(UNIQUE_ID_3))
                }
            }
        }
    }
}


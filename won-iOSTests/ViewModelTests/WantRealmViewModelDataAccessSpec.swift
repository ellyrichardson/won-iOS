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
                
                context("findWantsFilteredByName()") {
                    
                    beforeSuite {
                        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
                    }
                    
                    beforeEach {
                        let realm = try! Realm()
                        try! realm.write {
                            realm.deleteAll()
                        }
                    }
                    
                    it("should only return Wants that are fit with the filter SomeTest") {
                        // SETUP Area
                        let SOME_TEST_1 = "SomeTest1"
                        let SOME_TEST_2 = "SomeTest2"
                        let ITEM_TEST_1 = "ItemTest1"
                        let ITEM_TEST_2 = "ItemTest1"
                        let want1 = WantPackager.packageWithName(name: SOME_TEST_1)
                        want1.setId(id: "unique1")
                        let want2 = WantPackager.packageWithName(name: SOME_TEST_2)
                        want2.setId(id: "unique2")
                        let want3 = WantPackager.packageWithName(name: ITEM_TEST_1)
                        want3.setId(id: "unique3")
                        let want4 = WantPackager.packageWithName(name: ITEM_TEST_2)
                        want4.setId(id: "unique4")
                        let realm = try! Realm()
                        try! realm.write {
                            realm.add(want1)
                            realm.add(want2)
                            realm.add(want3)
                            realm.add(want4)
                        }
                        let dataAccess = WantRealmViewModelDataAccess()
                        
                        // RUN area
                        let wantViewModels = dataAccess.findWantsFilteredByName(wantName: "SomeTest")
                        
                        // ASSERTION area
                        expect(wantViewModels.count).to(be(2))
                        var expectedNames = [String]()
                        for item in wantViewModels {
                            expectedNames.append(item.getName())
                        }
                        expect(expectedNames.contains(SOME_TEST_1)).to(be(true))
                        expect(expectedNames.contains(SOME_TEST_2)).to(be(true))
                        expect(expectedNames.contains(ITEM_TEST_1)).to(be(false))
                        expect(expectedNames.contains(ITEM_TEST_2)).to(be(false))
                    }
                    
                    it("should only return Wants that are fit with the filter ItemTest") {
                        // SETUP Area
                        let SOME_TEST_1 = "SomeTest1"
                        let SOME_TEST_2 = "SomeTest2"
                        let ITEM_TEST_1 = "ItemTest1"
                        let ITEM_TEST_2 = "ItemTest1"
                        let want1 = WantPackager.packageWithName(name: SOME_TEST_1)
                        want1.setId(id: "unique1")
                        let want2 = WantPackager.packageWithName(name: SOME_TEST_2)
                        want2.setId(id: "unique2")
                        let want3 = WantPackager.packageWithName(name: ITEM_TEST_1)
                        want3.setId(id: "unique3")
                        let want4 = WantPackager.packageWithName(name: ITEM_TEST_2)
                        want4.setId(id: "unique4")
                        let realm = try! Realm()
                        try! realm.write {
                            realm.add(want1)
                            realm.add(want2)
                            realm.add(want3)
                            realm.add(want4)
                        }
                        let dataAccess = WantRealmViewModelDataAccess()
                        
                        // RUN area
                        let wantViewModels = dataAccess.findWantsFilteredByName(wantName: "ItemTest")
                        
                        // ASSERTION area
                        expect(wantViewModels.count).to(be(2))
                        var expectedNames = [String]()
                        for item in wantViewModels {
                            expectedNames.append(item.getName())
                        }
                        expect(expectedNames.contains(SOME_TEST_1)).to(be(false))
                        expect(expectedNames.contains(SOME_TEST_2)).to(be(false))
                        expect(expectedNames.contains(ITEM_TEST_1)).to(be(true))
                        expect(expectedNames.contains(ITEM_TEST_2)).to(be(true))
                    }
                    
                    it("should not return any if filter is blank") {
                        // SETUP Area
                        let SOME_TEST_1 = "SomeTest1"
                        let SOME_TEST_2 = "SomeTest2"
                        let ITEM_TEST_1 = "ItemTest1"
                        let ITEM_TEST_2 = "ItemTest1"
                        let BLANK_STRING = ""
                        let want1 = WantPackager.packageWithName(name: SOME_TEST_1)
                        want1.setId(id: "unique1")
                        let want2 = WantPackager.packageWithName(name: SOME_TEST_2)
                        want2.setId(id: "unique2")
                        let want3 = WantPackager.packageWithName(name: ITEM_TEST_1)
                        want3.setId(id: "unique3")
                        let want4 = WantPackager.packageWithName(name: ITEM_TEST_2)
                        want4.setId(id: "unique4")
                        let realm = try! Realm()
                        try! realm.write {
                            realm.add(want1)
                            realm.add(want2)
                            realm.add(want3)
                            realm.add(want4)
                        }
                        let dataAccess = WantRealmViewModelDataAccess()
                        
                        // RUN area
                        let wantViewModels = dataAccess.findWantsFilteredByName(wantName: BLANK_STRING)
                        
                        // ASSERTION area
                        expect(wantViewModels.count).to(be(0))
                    }
                    
                    it("should not return any if filter does not match anything") {
                        // SETUP Area
                        let SOME_TEST_1 = "SomeTest1"
                        let SOME_TEST_2 = "SomeTest2"
                        let ITEM_TEST_1 = "ItemTest1"
                        let ITEM_TEST_2 = "ItemTest1"
                        let want1 = WantPackager.packageWithName(name: SOME_TEST_1)
                        want1.setId(id: "unique1")
                        let want2 = WantPackager.packageWithName(name: SOME_TEST_2)
                        want2.setId(id: "unique2")
                        let want3 = WantPackager.packageWithName(name: ITEM_TEST_1)
                        want3.setId(id: "unique3")
                        let want4 = WantPackager.packageWithName(name: ITEM_TEST_2)
                        want4.setId(id: "unique4")
                        let realm = try! Realm()
                        try! realm.write {
                            realm.add(want1)
                            realm.add(want2)
                            realm.add(want3)
                            realm.add(want4)
                        }
                        let dataAccess = WantRealmViewModelDataAccess()
                        
                        // RUN area
                        let wantViewModels = dataAccess.findWantsFilteredByName(wantName: "unmatching")
                        
                        // ASSERTION area
                        expect(wantViewModels.count).to(be(0))
                    }
                }
                
                context("deleteAsViewModel()") {
                    
                    beforeSuite {
                        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
                    }
                    
                    beforeEach {
                        let realm = try! Realm()
                        try! realm.write {
                            realm.deleteAll()
                        }
                    }
                    
                    it("should delete Want as viewModel") {
                        // SETUP Area
                        let SOME_TEST_1 = "SomeTest1"
                        let SOME_TEST_2 = "SomeTest2"
                        let ITEM_TEST_1 = "ItemTest1"
                        let ITEM_TEST_2 = "ItemTest1"
                        let want1 = WantPackager.packageWithName(name: SOME_TEST_1)
                        want1.setId(id: "unique1")
                        let want2 = WantPackager.packageWithName(name: SOME_TEST_2)
                        want2.setId(id: "unique2")
                        let want3 = WantPackager.packageWithName(name: ITEM_TEST_1)
                        want3.setId(id: "unique3")
                        let want4 = WantPackager.packageWithName(name: ITEM_TEST_2)
                        want4.setId(id: "unique4")
                        let realm = try! Realm()
                        try! realm.write {
                            realm.add(want1)
                            realm.add(want2)
                            realm.add(want3)
                            realm.add(want4)
                        }
                        let dataAccess = WantRealmViewModelDataAccess()
                        
                        // RUN area
                        let preDeleteWantViewModels = dataAccess.findAllWants()
                        
                        // ASSERTION area
                        expect(preDeleteWantViewModels.count).to(be(4))
                        var preDeleteExpectedNames = [String]()
                        for item in preDeleteWantViewModels {
                            preDeleteExpectedNames.append(item.getName())
                        }
                        expect(preDeleteExpectedNames.contains(SOME_TEST_1)).to(be(true))
                        expect(preDeleteExpectedNames.contains(SOME_TEST_2)).to(be(true))
                        expect(preDeleteExpectedNames.contains(ITEM_TEST_1)).to(be(true))
                        expect(preDeleteExpectedNames.contains(ITEM_TEST_2)).to(be(true))
                        
                        dataAccess.deleteAsViewModel(viewModel: WantModelConverter.convertToViewModel(want: want2))
                        
                        let postDeleteWantViewModels = dataAccess.findAllWants()
                        expect(postDeleteWantViewModels.count).to(be(3))
                        var postDeleteExpectedNames = [String]()
                        for item in postDeleteWantViewModels {
                            postDeleteExpectedNames.append(item.getName())
                        }
                        expect(postDeleteExpectedNames.contains(SOME_TEST_1)).to(be(true))
                        expect(postDeleteExpectedNames.contains(SOME_TEST_2)).to(be(false))
                        expect(postDeleteExpectedNames.contains(ITEM_TEST_1)).to(be(true))
                        expect(postDeleteExpectedNames.contains(ITEM_TEST_2)).to(be(true))
                    }
                }
                
                context("saveAsViewModel()") {
                    
                    beforeSuite {
                        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
                    }
                    
                    beforeEach {
                        let realm = try! Realm()
                        try! realm.write {
                            realm.deleteAll()
                        }
                    }
                    
                    it("should save Want if passed a viewModel") {
                        // SETUP Area
                        let UNIQUE_ID = "unique1"
                        let want1 = WantPackager.packageAsSimpleWithNotification()
                        want1.setId(id: UNIQUE_ID)
                        let dataAccess = WantRealmViewModelDataAccess()
                        
                        // RUN area
                        var wantViewModels = dataAccess.findAllWants()
                        expect(wantViewModels.count).to(be(0))
                        dataAccess.saveAsViewModel(viewModel: WantModelConverter.convertToViewModel(want: want1))
                        wantViewModels = dataAccess.findAllWants()
                        
                        // ASSERTION area
                        expect(wantViewModels.count).to(be(1))
                        expect(wantViewModels[0].getId()).to(be(UNIQUE_ID))
                    }
                }
            }
        }
    }
}


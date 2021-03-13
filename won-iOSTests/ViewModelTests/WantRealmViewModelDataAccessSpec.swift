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
            context("find All Wants") {
                
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
                    let want1 = WantPackager.packageAsSimpleWith15DaysLeft()
                    let want2 = WantPackager.packageAsSimpleWith30DaysLeft()
                    let realm = try! Realm()
                    try! realm.write {
                        realm.add(want1)
                        realm.add(want2)
                    }
                    let dataAccess = WantRealmViewModelDataAccess()
                    // RUN area
                    let wantViewModels = dataAccess.findAllWants()
                    // ASSERTION area
                    //var 
                    for item in wantViewModels {
                        
                    }
                }

            }
        }
    }
}


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
                
                it("should return 30 days") {
                    
                }
            }
        }
    }
}

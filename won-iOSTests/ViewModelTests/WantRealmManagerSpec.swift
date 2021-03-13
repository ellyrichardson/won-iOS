//
//  WantRealmManagerSpec.swift
//  won-iOSTests
//
//  Created by Elly Richardson on 3/9/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import Quick
import Nimble
import RealmSwift
@testable import won_iOS

class WantRealmManagerSpec: QuickSpec {
    override func spec() {
        
        var tableView: UITableView!
        var sortConfig: [Any]!
        var wantRealmManager: WantRealmManager!
        var dataSource: WantDataSource!
        var delegate: WantDelegate!
        
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
                    sortConfig = [Any]()
                    sortConfig.append(WantSortType.DEFAULT)
                    sortConfig.append(WantSortOrder.DEFAULT)
                    
                    dataSource = WantDataSource()
                    delegate = WantDelegate(withDelegate: FakeVCDelegate())
                    wantRealmManager = createWantRealmManager()
                    
                    tableView = UITableView()
                    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
                    tableView.delegate = delegate
                    tableView.dataSource = dataSource
                    
                    // RUN area

                    // ASSERTION area

                }
            }
        }
        
        func createWantRealmManager() -> WantRealmManager {
            return {
                let manager = WantRealmManager(dataSource: dataSource)
                return manager
            }()
        }
    }
}


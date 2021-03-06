//
//  WantViewModel.swift
//  won-iOS
//
//  Created by Elly Richardson on 11/23/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import RealmSwift

struct WantRealmManager {
    typealias PrimaryActionHandler = ([Int], [Int], [Int]) -> Void
    typealias InitialActionHandler = () -> Void
    
    var dataSource: WantRealmViewModelDataAccess?
    
    init(dataSource : WantRealmViewModelDataAccess?) {
        self.dataSource = dataSource
    }
    
    // This observes changes in realm collection and updates the tableview it needs to update accordingly. These changes are deletions, insetions, and modifications to a tableView
    func createNotificationToken(wantNameFilter: String, initialAction: @escaping InitialActionHandler, primaryAction: @escaping PrimaryActionHandler) -> NotificationToken {
        //let results = dataSource?.findResultsOfType(type: Want.self)
        //let results = dataSource?.findResultsOfType(type: Want.self).filter("ANY name.contains(" + wantNameFilter + ")")
        let results = filterResult(wantName: wantNameFilter, results: (dataSource?.findResultsOfType(type: Want.self))!)
        //results!
        
        let token = results.observe { (changes: RealmCollectionChange) in
            switch changes {
            case .initial(_):
                initialAction()
            case .update(_, let deletions, let insertions, let modifications):
                primaryAction(deletions, insertions, modifications)
            case .error(let error):
                // An error occurred while opening the Realm file on the background worker thread
                fatalError("\(error)")
            }
        }
        return token
    }
    
    // CAN REMOVE
    private func filterResult(wantName: String, results: Results<Want>) -> Results<Want> {
        if !wantName.isEmpty {
            //return results.filter("ANY name.contains(" + wantName + ")")
            return results.filter("name contains[c] %@", wantName)
        }
        return results
    }
}

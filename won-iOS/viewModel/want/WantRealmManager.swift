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
    func createNotificationToken(sortConfig: [Any], wantNameFilter: String, initialAction: @escaping InitialActionHandler, primaryAction: @escaping PrimaryActionHandler) -> NotificationToken {
        let filteredResults = filterResult(wantName: wantNameFilter, results: (dataSource?.findResultsOfType(type: Want.self))!)
        let results = checkForSortingResults(sortConfig: sortConfig, results: filteredResults)
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
    
    private func checkForSortingResults(sortConfig: [Any], results: Results<Want>) -> Results<Want> {
        var sortType: WantSortType?
        var sortOrder: WantSortOrder?
        if let configType = sortConfig[0] as? WantSortType {
            sortType = configType
        }
        if let configOrder = sortConfig[1] as? WantSortOrder {
            sortOrder = configOrder
        }
        
        if sortType != nil && sortOrder != nil {
            //results.sorted(by: {$0.getDateCreated() < $1.getDateCreated()})
            return sortResults(sortType: sortType!, sortOrder: sortOrder!, results: results)
        } else {
            //print("sortType or sortOrder was nil")
            return results
        }
    }
    
    private func sortResults(sortType: WantSortType, sortOrder: WantSortOrder, results: Results<Want>) -> Results<Want> {
        if sortType == WantSortType.BY_AGE && sortOrder == WantSortOrder.ASCENDING {
            return results.sorted(byKeyPath: "dateCreated", ascending: true)
        }
        else if sortType == WantSortType.BY_AGE && sortOrder == WantSortOrder.DESCENDING {
            return results.sorted(byKeyPath: "dateCreated", ascending: false)
        }
        else if sortType == WantSortType.BY_INTEREST_POINTS && sortOrder == WantSortOrder.ASCENDING {
            return results.sorted(byKeyPath: "points", ascending: true)
        }
        else if sortType == WantSortType.BY_INTEREST_POINTS && sortOrder == WantSortOrder.DESCENDING {
            return results.sorted(byKeyPath: "points", ascending: false)
        }
        return results
    }
    
    private func filterResult(wantName: String, results: Results<Want>) -> Results<Want> {
        if !wantName.isEmpty {
            //return results.filter("ANY name.contains(" + wantName + ")")
            return results.filter("name contains[c] %@", wantName)
        }
        return results
    }
}

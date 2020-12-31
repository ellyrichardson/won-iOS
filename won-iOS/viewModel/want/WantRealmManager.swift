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
    
    func createNotificationToken(initialAction: @escaping InitialActionHandler, primaryAction: @escaping PrimaryActionHandler) -> NotificationToken {
        let results = dataSource?.findResultsOfType(type: Want.self)
        let token = results!.observe { (changes: RealmCollectionChange) in
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
}

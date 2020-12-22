//
//  WantViewModel.swift
//  won-iOS
//
//  Created by Elly Richardson on 11/23/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import RealmSwift

struct WantViewModel: ViewModel {
    typealias PrimaryActionHandler = ([Int], [Int], [Int]) -> Void
    typealias InitialActionHandler = () -> Void
    
    var dataSource: WantRealmSource?
    
    // TODO: FIGURE OUT WHERE TO PUT REALM INSTANCE
    
    init(dataSource : WantRealmSource?) {
        self.dataSource = dataSource
    }
    
    func addNewWant(want: Want) {
        dataSource?.saveObject(object: want)
    }
    
    func addWatcherToWant(want: Want, watcher: String) {
        var watchers = want.getSocialStatus().getWatchers()
        watchers.insert(watcher)
        want.getSocialStatus().setWatchers(watchers: watchers)
    }
    
    func deleteWant(want: Want) {
        dataSource?.deleteObject(object: want)
    }
    
    func createNotificationToken(initialAction: @escaping InitialActionHandler, primaryAction: @escaping PrimaryActionHandler) -> NotificationToken {
        let results = dataSource?.findResultsOfType(type: getModelType())
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
    
    func getModelType() -> Want.Type {
        return (dataSource?.getType())!
    }
    
    //TODO: Add a loader from Realm DB
}

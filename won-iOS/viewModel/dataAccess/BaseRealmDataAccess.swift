//
//  RealmGenericSource.swift
//  won-iOS
//
//  Created by Elly Richardson on 11/26/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import RealmSwift

class BaseRealmDataAccess<T>: NSObject {
    private let realm = try! Realm()
    func findAll<T: Object>() -> [T] {
        return realm.objects(T.self).map { $0 }
    }
    
    func findById<T: Object>(id: String) -> T {
        return realm.object(ofType: T.self, forPrimaryKey: id)!
    }
    
    func save<T: Object>(object: T) {
        try! realm.write {
            realm.add(object, update: .modified)
        }
    }
    
    func deleteAll() {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    func delete<T: Object>(object: T) {
        try! realm.write {
            realm.delete(object)
        }
    }
    
    func findResultsOfType<T: Object>(type: T.Type) -> Results<T> {
        return realm.objects(type)
    }
    
    func getType() -> T.Type {
        return T.self
    }
}

//
//  RealmGenericSource.swift
//  won-iOS
//
//  Created by Elly Richardson on 11/26/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import RealmSwift

class RealmGenericSource<T>: NSObject {
    private let realm = try! Realm()
    func findAll<T: Object>() -> [T] {
        return realm.objects(T.self).map { $0 }
    }
    
    func saveObject<T: Object>(object: T) {
        try! realm.write {
            realm.add(object, update: .modified)
        }
    }
    
    func deleteObject<T: Object>(object: T) {
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

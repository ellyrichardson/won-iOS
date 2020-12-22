//
//  WantRealmSource.swift
//  won-iOS
//
//  Created by Elly Richardson on 12/4/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

class WantRealmSource: RealmGenericSource<Want>, WantRealmSourceProtocol {
    func findAllWants() -> [Want] {
        return findAll()
    }
}

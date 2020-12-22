//
//  WantSocial.swift
//  won-iOS
//
//  Created by Elly Richardson on 11/21/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import RealmSwift

class WantSocialStatus: Object {
    @objc dynamic var commentCount: Int = 0
    private dynamic var watchers: Set<String>?
    
    /*
    init() {
        self.commentCount = 0
        self.watchers = Set<String>()
    }*/
    
    convenience init(watchers: Set<String>, commentCount: Int) {
        self.init()
        self.watchers = watchers
        self.commentCount = commentCount
    }
    
    public func getCommentCount() -> Int {
        return commentCount
    }
    
    public func setCommentCount(commentCount: Int) {
        self.commentCount = commentCount
    }
    
    public func getWatchers() -> Set<String> {
        return watchers!
    }
    
    public func setWatchers(watchers: Set<String>) {
        self.watchers = watchers
    }
    
    /*
    public func addWatcher(watcher: String) {
        self.watchers.insert(watcher)
    }*/
}

//
//  Want.swift
//  won-iOS
//
//  Created by Elly Richardson on 11/21/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import RealmSwift

class Want: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var owner: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var points: Int = 0
    @objc dynamic var notes: String = ""
    @objc dynamic var socialStatus: WantSocialStatus?
    //private var privacy: PrivacyType
    // private var timeSpan: TimeSpan
    //private var notification: Notification
    private dynamic var history: WantHistory?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(id: String, owner: String, name: String, points: Int, notes: String, socialStatus: WantSocialStatus, history: WantHistory) {
        self.init()
        self.id = id
        self.owner = owner
        self.name = name
        self.points = points
        self.notes = notes
        self.socialStatus = socialStatus
        self.history = history
    }
 
    public func getId() -> String {
        return id
    }
    
    public func setId(id: String) {
        self.id = id
    }
    
    public func getOwner() -> String {
        return owner
    }
    
    public func setOwner(owner: String) {
        self.owner = owner
    }
    
    public func getName() -> String {
        return name
    }
    
    public func setName(name: String) {
        self.name = name
    }
    
    public func getPoints() -> Int {
        return points
    }
    
    public func setPoints(points: Int) {
        self.points = points
    }
    
    public func getNotes() -> String {
        return notes
    }
    
    public func setNotes(notes: String) {
        self.notes = notes
    }
    
    public func getSocialStatus() -> WantSocialStatus {
        return socialStatus!
    }
    
    public func setSocialStatus(socialStatus: WantSocialStatus) {
        self.socialStatus = socialStatus
    }
    
    public func getHistory() -> WantHistory {
        return history!
    }
    
    public func setHistory(history: WantHistory) {
        self.history = history
    }
}

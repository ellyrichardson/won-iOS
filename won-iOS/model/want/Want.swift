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
    @objc dynamic var daysLeft: Int = 0
    @objc dynamic var notes: String = ""
    @objc dynamic var imagePath: String = ""
    @objc dynamic var socialStatus: WantSocialStatus?
    @objc dynamic var obtained: Bool = false
    @objc dynamic var obtainedDate: Date?
    @objc dynamic var dateCreated: Date = Date()
    @objc dynamic var dateModified: Date = Date()
    
    //private var privacy: PrivacyType
    // private var timeSpan: TimeSpan
    //private var notification: Notification
    //@objc dynamic var history: WantHistory?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(id: String, owner: String, name: String, points: Int, imagePath: String, notes: String, obtained: Bool, obtainedDate: Date, dateCreated: Date, dateModified: Date, socialStatus: WantSocialStatus) {
        self.init()
        self.id = id
        self.owner = owner
        self.name = name
        self.daysLeft = getPreparedDaysLeft()
        self.points = points
        self.imagePath = imagePath
        self.notes = notes
        self.socialStatus = socialStatus
        self.obtained = obtained
        self.obtainedDate = obtainedDate
        self.dateCreated = dateCreated
        self.dateModified = dateModified
        //self.history = history
    }
    
    private func getPreparedDaysLeft() -> Int {
        let wantDueDate = DateUtils.addDayToDate(date: self.dateCreated, days: 30.0)
        return DateUtils.daysBetweenTwoDates(earlyDate: self.dateCreated, laterDate: wantDueDate)
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
    
    public func setDaysLeft(daysLeft: Int) {
        self.daysLeft = daysLeft
    }
    
    public func getDaysLeft() -> Int {
        return daysLeft
    }
    
    public func getNotes() -> String {
        return notes
    }
    
    public func setNotes(notes: String) {
        self.notes = notes
    }
    
    func getImagePath() -> String {
        return imagePath
    }
    
    func setImagePath(imagePath: String) {
        self.imagePath = imagePath
    }
    
    public func getSocialStatus() -> WantSocialStatus {
        return socialStatus!
    }
    
    public func setSocialStatus(socialStatus: WantSocialStatus) {
        self.socialStatus = socialStatus
    }
    
    public func isObtained() -> Bool {
        return obtained
    }
    
    public func setObtained(obtained: Bool) {
        self.obtained = obtained
    }
    
    public func getObtainedDate() -> Date {
        return obtainedDate!
    }
    
    public func setObtainedDate(obtainedDate: Date) {
        self.obtainedDate = obtainedDate
    }
    
    public func getDateCreated() -> Date {
        return dateCreated
    }
    
    public func setDateCreated(dateCreated: Date) {
        self.dateCreated = dateCreated
    }
    
    public func getDateModified() -> Date {
        return dateModified
    }
    
    public func setDateModified(dateModified: Date) {
        self.dateModified = dateModified
    }
}

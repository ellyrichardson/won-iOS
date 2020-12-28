//
//  WantViewModel.swift
//  won-iOS
//
//  Created by Elly Richardson on 12/21/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import UIKit

class WantViewModel {
    private var id: String
    private var owner: String
    private var name: String
    private var points: Int
    private var notes: String
    private var obtained: Bool
    private var obtainedDate: Date?
    private var dateCreated: Date
    private var dateModified: Date
    
    public init() {
        self.id = ""
        self.owner = ""
        self.name = ""
        self.points = 0
        self.notes = ""
        self.obtained = false
        self.dateCreated = Date()
        self.dateModified = Date()
    }
    
    /*
    public init (id: String, owner: String, name: String, points: Int, notes: String, obtained: Bool, dateCreated: Date, dateModified: Date) {
        self.id = id
        self.owner = owner
        self.name = name
        self.points = points
        self.notes = notes
        self.obtained = obtained
        self.dateCreated = dateCreated
        self.dateModified = dateModified
    }*/
    
    public func configureTableViewCell(cell: WantTVCell) {
        cell.wantName.text = self.name
        cell.pointsLabel.text = String(self.points)
    }
    
    public func configureWanterestPointsValueLabel(label: UILabel) {
        label.text = String(self.points)
    }
    
    public func configureWantDateCreatedValueLabel(label: UILabel) {
        label.text = DateTimeFunctions.dateToStringDMmmY(date: self.dateCreated)
    }
    
    public func configureWantDateModifiedValueLabel(label: UILabel) {
        label.text = DateTimeFunctions.dateToStringDMmmY(date: self.dateModified)
    }
    
    public func configureWantNameValueLabel(label: UILabel) {
        label.text = "< " + self.name
    }
    
    public func configureWantObtainedValueLabel(label: UILabel) {
        if self.obtained {
            label.text = "OBTAINED"
        } else {
            label.text = "NOT OBTAINED"
        }
    }
    
    public func configureWantObtainedDateValueLabel(label: UILabel) {
        if self.obtainedDate == nil {
            label.text = "---------"
        } else {
            label.text = DateTimeFunctions.dateToStringDMmmY(date: self.obtainedDate!)
        }
    }
    
    public func setOwner(owner: String) {
        self.owner = owner
    }
    
    public func getOwner() -> String {
        return owner
    }
    
    public func setName(name: String) {
        self.name = name
    }
    
    public func getName() -> String {
        return name
    }
    
    public func setPoints(points: String) {
        self.points = Int(points)!
    }
    
    public func getPoints() -> String {
        return String(points)
    }
    
    public func setNotes(notes: String) {
        self.notes = notes
    }
    
    public func getNotes() -> String {
        return notes
    }
    
    public func setId(id: String) {
        self.id = id
    }
    
    public func getId() -> String {
        return id
    }
    
    public func setObtained(obtained: Bool) {
        self.obtained = obtained
    }
    
    public func getObtained() -> Bool {
        return obtained
    }
    
    public func getObtainedDate() -> Date {
        return obtainedDate!
    }
    
    public func setObtainedDate(obtainedDate: Date) {
        self.obtainedDate = obtainedDate
    }
    
    public func setDateCreated(dateCreated: Date) {
        self.dateCreated = dateCreated
    }
    
    public func getDateCreated() -> Date {
        return dateCreated
    }
    
    public func setDateModified(dateModified: Date) {
        self.dateModified = dateModified
    }
    
    public func getDateModified() -> Date {
        return dateModified
    }
}

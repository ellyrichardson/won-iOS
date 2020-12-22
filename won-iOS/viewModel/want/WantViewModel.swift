//
//  WantViewModel.swift
//  won-iOS
//
//  Created by Elly Richardson on 12/21/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import Foundation

class WantViewModel {
    private var id: String
    private var owner: String
    private var name: String
    private var points: Int
    private var notes: String
    
    public init (id: String, owner: String, name: String, points: Int, notes: String) {
        self.id = id
        self.owner = owner
        self.name = name
        self.points = points
        self.notes = notes
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
}

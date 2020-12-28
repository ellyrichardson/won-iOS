//
//  WantViewModelBuilder.swift
//  won-iOS
//
//  Created by Elly Richardson on 12/28/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import Foundation

class WantViewModelBuilder {
    private var wantViewModel: WantViewModel
    
    init() {
        wantViewModel = WantViewModel()
    }
    
    func withId(id: String) -> WantViewModelBuilder {
        wantViewModel.setId(id: id)
        return self
    }
    
    func withOwner(owner: String) -> WantViewModelBuilder {
        wantViewModel.setOwner(owner: owner)
        return self
    }
    
    func withName(name: String) -> WantViewModelBuilder {
        wantViewModel.setName(name: name)
        return self
    }
    
    func withPoints(points: Int) -> WantViewModelBuilder {
        wantViewModel.setPoints(points: String(points))
        return self
    }
    
    func withNotes(notes: String) -> WantViewModelBuilder {
        wantViewModel.setNotes(notes: notes)
        return self
    }
    
    func withObtained(obtained: Bool) -> WantViewModelBuilder {
        wantViewModel.setObtained(obtained: obtained)
        return self
    }
    
    func withDateCreated(dateCreated: Date) -> WantViewModelBuilder {
        wantViewModel.setDateCreated(dateCreated: dateCreated)
        return self
    }
    
    func withDateModified(dateModified: Date) -> WantViewModelBuilder {
        wantViewModel.setDateModified(dateModified: dateModified)
        return self
    }
    
    func build() -> WantViewModel {
        return wantViewModel
    }
}

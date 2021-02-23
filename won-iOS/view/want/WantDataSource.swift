//
//  WantTableViewDataSource.swift
//  won-iOS
//
//  Created by Elly Richardson on 11/22/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import UIKit
import RealmSwift

class WantDataSource: WantRealmViewModelDataAccess, UITableViewDataSource {
    private final let WANT_TABLE_VIEW_CELL = "wantTVCell"
    private var sortType = WantSortType.DEFAULT
    private var sortOrder = WantSortOrder.DEFAULT
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return findAllWants().count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WANT_TABLE_VIEW_CELL, for: indexPath) as? WantTVCell else {
            fatalError("The dequeued cell is not an instance of WantTVCell.")
        }
        let results = findSortedWants(sortType: sortType, sortOrder: sortOrder)
        let wantViewModel = results[indexPath.row]
        wantViewModel.configureTableViewCell(cell: cell)
        return cell
    }
    
    func setSortType(sortType: WantSortType) {
        self.sortType = sortType
    }
    
    func setSortOrder(sortOrder: WantSortOrder) {
        self.sortOrder = sortOrder
    }
}

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
        let results = findAllWants()
        let wantViewModel = results[indexPath.row]
        wantViewModel.configureTableViewCell(cell: cell)
        return cell
    }
}

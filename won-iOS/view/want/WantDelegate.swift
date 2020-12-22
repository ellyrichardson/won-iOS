//
//  WantDelegate.swift
//  won-iOS
//
//  Created by Elly Richardson on 12/5/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import UIKit

class WantDelegate : WantRealmSource, UITableViewDelegate {
    private let SHOW_WANT_DETAILS_SEGUE = "showWantDetails"
    
    weak var delegate: VCDelegate?
    
    private var wantViewModel: WantViewModel?
    
    // #2
    init(withDelegate delegate: VCDelegate, wantViewModel: WantViewModel) {
        self.delegate = delegate
        self.wantViewModel = wantViewModel
    }
    
    // #3
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if delegate != nil {
            let presentedWants = findAllWants()
            self.delegate?.selectedCell(sender: presentedWants[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let presentedWants = findAllWants()
        if editingStyle == .delete {
            wantViewModel?.deleteWant(want: presentedWants[indexPath.row])
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}

//
//  WantVC.swift
//  won-iOS
//
//  Created by Elly Richardson on 11/15/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import UIKit
import RealmSwift

class WantVC: UIViewController, VCDelegate {
    private let SHOW_WANT_DETAILS_SEGUE = "showWantDetails"
    
    @IBOutlet weak var addWantButton: CircleButton!
    @IBOutlet weak var sortWantsButton: CircleButton!
    @IBOutlet weak var wantsTableView: UITableView!
    
    private let dataSource = WantDataSource()
    private var delegate: WantDelegate?
    private var notificationToken: NotificationToken? = nil
    
    // TEMPorarily removed: private weak var selectedWant: Want?
    
    
    lazy var wantRealmManager: WantRealmManager = {
        let manager = WantRealmManager(dataSource: dataSource)
        return manager
    }()
    
    /*
    lazy var realmManager: RealmManager = {
        let realmManager = RealmManager(dataSource: dataSource)
        return realmManager
    }()*/

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = WantDelegate(withDelegate: self)
        self.wantsTableView.dataSource = self.dataSource
        self.wantsTableView.delegate = self.delegate
        self.wantsTableView.rowHeight = 102.0
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        notificationToken = wantRealmManager.createNotificationToken(initialAction: {
            self.wantsTableView.reloadData()
        }, primaryAction: {deletions,insertions,modifications in
            self.updateTableView(deletions: deletions, insertions: insertions, modifications: modifications)
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.wantsTableView.reloadData()
    }
    
    /*
    @IBAction func unwindToHere( _ seg: UIStoryboardSegue) {
        
        if (seg.identifier == UNWIND_SEGUE_TO_WANTS) {
            let wantVC = seg.destination as! WantVC
            // do stuff here
            wantVC.reloadWantsTableViewData()
        }
    }*/
    
    
    private func updateTableView(deletions: [Int], insertions: [Int], modifications: [Int]) {
        self.wantsTableView.beginUpdates()
        // Always apply updates in the following order: deletions, insertions, then modifications.
        // Handling insertions before deletions may result in unexpected behavior.
        self.wantsTableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
                             with: .automatic)
        self.wantsTableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
                             with: .automatic)
        self.wantsTableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
                             with: .automatic)
        self.wantsTableView.endUpdates()
    }
    
    deinit {
        notificationToken?.invalidate()
    }
    
    // Sender is expected to be a WantViewModel
    func selectedCell(sender: AnyObject) {
        self.performSegue(withIdentifier: SHOW_WANT_DETAILS_SEGUE, sender: sender)
    }
    
    func reloadWantsTableViewData() {
        self.wantsTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SHOW_WANT_DETAILS_SEGUE {
            let destNavCtrl = segue.destination as! UINavigationController
            let wantDetailsVC = destNavCtrl.topViewController as! WantDetailsVC
            wantDetailsVC.setWantRealmManager(WantRealmManager: self.wantRealmManager)
        }
    }
}

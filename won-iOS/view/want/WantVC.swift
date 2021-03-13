//
//  WantVC.swift
//  won-iOS
//
//  Created by Elly Richardson on 11/15/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import UIKit
import RealmSwift
import SwiftEntryKit

class WantVC: UIViewController, VCDelegate, DataReceivingVCProtocol, UISearchBarDelegate {
    
    private let SHOW_WANT_DETAILS_SEGUE = "showWantDetails"
    
    @IBOutlet weak var wantImageView: UIImageView!
    @IBOutlet weak var addWantButton: CircleButton!
    @IBOutlet weak var sortWantsButton: CircleButton!
    @IBOutlet weak var wantsTableView: UITableView!
    
    private let dataSource = WantDataSource()
    private var delegate: WantDelegate?
    private var sortConfig = [Any]()
    private var notificationToken: NotificationToken? = nil
    private var wantNameFilter = "" // CAN REMOVE
    @IBOutlet weak var wantsSearchBar: UISearchBar!
    
    lazy var wantRealmManager: WantRealmManager = {
        let manager = WantRealmManager(dataSource: dataSource)
        return manager
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = WantDelegate(withDelegate: self)
        self.wantsTableView.dataSource = self.dataSource
        self.wantsTableView.delegate = self.delegate
        self.wantsTableView.rowHeight = 102.0
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        setupInitialSortConfig()
        notificationToken = createWantRealmNotificationToken()
        wantsSearchBar.delegate = self
        addWantButton.contentMode = .center
        addWantButton.imageView?.contentMode = .scaleAspectFit
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        TimerProcess.sharedTimer.runTimer(withInterval: 1.0)
        self.wantsTableView.reloadData()
    }
    
    func action(sender: Any) {
        // Write some stuff here
    }
    
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
            wantDetailsVC.setWantViewModel(wantViewModel: sender as! WantViewModel)
        }
        TimerProcess.sharedTimer.pauseTimer()
    }
    
    @IBAction func sortWantsBtnPressed(_ sender: CircleButton) {
        self.hideKeyboard() // Hides keyboard if it is present
        let vc = SortWantsVC()
        vc.setDelegate(delegate: self)
        SwiftEntryKit.display(entry: vc, using: PresetsDataSource.getPopupPreset())
    }
    
    func passData(data: Any) {
        if let passedData = data as? [Any] {
            self.sortConfig = passedData
            updateDataSourceForSorting()
        }
    }
    
    private func updateDataSourceForSorting() {
        var sortType: WantSortType?
        var sortOrder: WantSortOrder?
        if let configType = self.sortConfig[0] as? WantSortType {
            sortType = configType
        }
        if let configOrder = self.sortConfig[1] as? WantSortOrder {
            sortOrder = configOrder
        }
        
        if sortType != nil && sortOrder != nil {
            self.dataSource.setSortType(sortType: sortType!)
            self.dataSource.setSortOrder(sortOrder: sortOrder!)
            self.delegate?.setSortType(sortType: sortType!)
            self.delegate?.setSortOrder(sortOrder: sortOrder!)
            self.wantsTableView.delegate  = self.delegate
            self.wantsTableView.dataSource = self.dataSource
            self.wantsTableView.reloadData()
        } else {
            print("sortType or sortOrder was nil")
        }
        // Updates the current notificationToken to have the sorting configs
        self.notificationToken = createWantRealmNotificationToken()
    }
    
    private func setupInitialSortConfig() {
        self.sortConfig.append(WantSortType.DEFAULT)
        self.sortConfig.append(WantSortOrder.DEFAULT)
    }
    
    func createWantRealmNotificationToken() -> NotificationToken {
        return wantRealmManager.createNotificationToken(sortConfig: self.sortConfig, wantNameFilter: wantNameFilter, initialAction: {
            self.wantsTableView.reloadData()
        }, primaryAction: {deletions,insertions,modifications in
            self.updateTableView(deletions: deletions, insertions: insertions, modifications: modifications)
        })
    }
    
    /*
     Create a ui search bar
     
     use this view as delegate
     
     add 
     
     */
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.wantNameFilter = searchText
        self.dataSource.setNameFilter(nameFilter: searchText)
        self.delegate?.setNameFilter(nameFilter: searchText)
        // Updates the current notificationToken to have the filter
        self.notificationToken = createWantRealmNotificationToken()
        self.wantsTableView.reloadData()
    }
}

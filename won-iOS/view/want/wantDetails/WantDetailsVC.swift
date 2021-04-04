//
//  WantDetailsVC.swift
//  won-iOS
//
//  Created by Elly Richardson on 12/2/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import UIKit
import SwiftEntryKit

class WantDetailsVC: UIViewController, DetachedVCDelegate {
    
    private let DETAILS_TABLE_VIEW_SEGUE = "detailsTableViewSegue"
    
    //@IBOutlet weak var wantNameLabel: UILabel!
    private var wantViewModel: WantViewModel?
    
    private weak var detailsTVC: WantDetailsTableVC?
    
    @IBOutlet weak var dismissPageBtn: UIButton!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var optionsButton: UIButton!
    @IBOutlet weak var deleteButton: CircleButton!
    
    private var vcProcessor: WantDetailsVCProcessor?
    
    // MOVE OUT PARTS to vcProcessor
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        //wantViewModel?.configureWantNameButtonLabel(button: dismissPageBtn)
        vcProcessor = WantDetailsVCProcessorImpl(viewModel: self.wantViewModel!)
        vcProcessor?.configureDismissPageBtn(dismissPageBtn: self.dismissPageBtn)
    }
    
    func setWantViewModel(wantViewModel: WantViewModel) {
        self.wantViewModel = wantViewModel
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if (segue.identifier == DETAILS_TABLE_VIEW_SEGUE) {
            detailsTVC = (segue.destination as! WantDetailsTableVC)
            detailsTVC!.setWantViewModel(wantViewModel: wantViewModel!)
            // Now you have a pointer to the child view controller.
            // You can save the reference to it, or pass data to it.
        }
    }
    
    @IBAction func dismissPageBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MOVE OUT some parts to vcProcessor (the part that is not self.keyBoard)
    @IBAction func optionsBtnPressed(_ sender: UIButton) {
        self.hideKeyboard()
        // Hides keyboard if it is present
        //utilize vcProcessor
        //let vc = EditWantVC()
        //vc.detachedVCDelegate = self
        //vc.setWantViewModel(wantViewModel: wantViewModel!)
        SwiftEntryKit.display(entry: (vcProcessor?.configureDetachedEditWantVC(detachedVC: EditWantVC(), delegateVC: self))!, using: PresetsDataSource.getPopupPreset())
    }
    
    @IBAction func deleteBtnPressed(_ sender: UIButton) {
        
    }
    
    // MOVE OUT all parts to vcProcessor
    func action(sender: Any) {
        // Do something
        //performSegue(withIdentifier: "segueToEditWantVC", sender: self)
        self.wantViewModel = (sender as! WantViewModel)
        vcProcessor?.saveWantDetailsChanges(dismissPageBtn: self.dismissPageBtn, detailsTableVC: self.detailsTVC!)
        self.detailsTVC!.tableView.reloadData()
        //wantViewModel?.configureWantNameButtonLabel(button: dismissPageBtn)
        //wantViewModel?.updateWantDetails(wantViewModel: self.wantViewModel!, detailsTableVC: detailsTVC!)
    }
}

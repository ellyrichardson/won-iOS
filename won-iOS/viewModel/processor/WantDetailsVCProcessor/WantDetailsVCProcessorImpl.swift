//
//  WantDetailsVCProcessorImpl.swift
//  won-iOS
//
//  Created by Elly Richardson on 3/31/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import UIKit

class WantDetailsVCProcessorImpl: WantDetailsVCProcessor {
    
    //private var dataAccess: WantRealmViewModelDataAccessProtocol
    
    private var viewModel: WantViewModel
    
    init(viewModel: WantViewModel) {
        //self.dataAccess = dataAccess
        self.viewModel = viewModel
    }
    
    /*
    func setDataAccess(dataAccess: WantRealmViewModelDataAccessProtocol) {
        self.dataAccess = dataAccess
    }*/
    
    func setViewModel(viewModel: WantViewModel) {
        self.viewModel = viewModel
    }
    
    func configureDetachedEditWantVC(detachedVC: EditWantVC, delegateVC: DetachedVCDelegate) -> EditWantVC {
        detachedVC.setDetachedVCDelegate(delegate: delegateVC)
        detachedVC.setWantViewModel(wantViewModel: self.viewModel)
        return detachedVC
    }
    
    func saveWantDetailsChanges(dismissPageBtn: UIButton, detailsTableVC: WantDetailsTableVC) {
        self.configureDismissPageBtn(dismissPageBtn: dismissPageBtn)
        // To update WantDetailsTableVC when a Want is being edited
        detailsTableVC.setWantViewModel(wantViewModel: self.viewModel)
        detailsTableVC.tableView.reloadData()
    }
    
    func configureDismissPageBtn(dismissPageBtn: UIButton) {
        dismissPageBtn.setTitle("< " + viewModel.getName(), for: .normal)
    }
}

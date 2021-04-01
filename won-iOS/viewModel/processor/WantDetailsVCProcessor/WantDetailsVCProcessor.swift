//
//  WantDetailsVCProcessor.swift
//  won-iOS
//
//  Created by Elly Richardson on 3/31/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import UIKit

protocol WantDetailsVCProcessor {
    //func setDataAccess(dataAccess: WantRealmViewModelDataAccessProtocol)
    func setViewModel(viewModel: WantViewModel)
    func configureDetachedEditWantVC(detachedVC: EditWantVC, delegateVC: DetachedVCDelegate) -> EditWantVC
    func saveWantDetailsChanges(dismissPageBtn: UIButton, detailsTableVC: WantDetailsTableVC)
    func configureDismissPageBtn(dismissPageBtn: UIButton)
}

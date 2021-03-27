//
//  WantNotesDetailsVCProcessor.swift
//  won-iOS
//
//  Created by Elly Richardson on 3/23/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import UIKit

protocol WantNotesDetailsVCProcessor {
    func setDataAccess(dataAccess: WantRealmViewModelDataAccessProtocol)
    func setViewModel(viewModel: WantViewModel)
    func configureNotesTextView(notesTextVew: UITextView)
    func saveNotesUpdate()
    func updateNotesTextView(textView: UITextView)
}

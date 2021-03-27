//
//  WantNotesDetailsVCProcessorImpl.swift
//  won-iOS
//
//  Created by Elly Richardson on 3/23/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import UIKit

class WantNotesDetailsVCProcessorImpl: WantNotesDetailsVCProcessor {
    private var dataAccess: WantRealmViewModelDataAccessProtocol
    
    private var viewModel: WantViewModel
    
    init(dataAccess: WantRealmViewModelDataAccessProtocol, viewModel: WantViewModel) {
        self.dataAccess = dataAccess
        self.viewModel = viewModel
    }
    
    func setDataAccess(dataAccess: WantRealmViewModelDataAccessProtocol) {
        self.dataAccess = dataAccess
    }
    
    func setViewModel(viewModel: WantViewModel) {
        self.viewModel = viewModel
    }
    
    func configureNotesTextView(notesTextVew: UITextView) {
        notesTextVew.text = self.viewModel.getNotes()
    }
    
    func saveNotesUpdate() {
        dataAccess.updateNotesAsViewModel(viewModel: self.viewModel)
    }
    
    func updateNotesTextView(textView: UITextView) {
        self.viewModel.setNotes(notes: textView.text)
    }
}

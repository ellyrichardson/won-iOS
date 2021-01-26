//
//  WantNotesDetailsVC.swift
//  won-iOS
//
//  Created by Elly Richardson on 1/10/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import UIKit

class WantNotesDetailsVC: UIViewController, UITextViewDelegate {
    @IBOutlet weak var notesTextVew: UITextView!
    @IBOutlet weak var wantNotesView: UIView!
    
    private var wantViewModel: WantViewModel?
    private var dataAccess: WantRealmViewModelDataAccess?
    
    func setWantViewModel(wantViewModel: WantViewModel) {
        self.wantViewModel = wantViewModel
    }
    
    func setDataAccess(dataAccess: WantRealmViewModelDataAccess) {
        self.dataAccess = dataAccess
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.notesTextVew.delegate = self
        self.notesTextVew.text = wantViewModel?.getNotes()
        print("NOTES in WNLVC: " + self.notesTextVew.text)
        // Do any additional setup after loading the view.
        self.wantNotesView.layer.cornerRadius = 10;
        self.wantNotesView.layer.masksToBounds = true;
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        dataAccess?.updateNotesAsViewModel(viewModel: self.wantViewModel!)
    }
    
    func textViewDidChange(_ textView: UITextView) { //Handle the text changes here
        self.wantViewModel?.setNotes(notes: textView.text)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

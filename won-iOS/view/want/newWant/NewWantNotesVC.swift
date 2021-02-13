//
//  NewWantNotesVC.swift
//  won-iOS
//
//  Created by Elly Richardson on 12/8/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import UIKit

class NewWantNotesVC: UIViewController, UITextViewDelegate {
    
    let UNWIND_TO_ATTRIBUTES_VC = "unwindToNewWantAttributesTableVC"
    
    typealias EditedTextHandler = (_ name: String) -> Void
    
    @IBOutlet weak var dismissPageButton: UIButton!
    @IBOutlet weak var notesTextView: UITextView!
    
    //var didEditWantNotes: (EditedTextHandler)?
    private var wantNotes: String?
    private var delegate: DataReceivingVCProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notesTextView.delegate = self
        notesTextView.text = wantNotes

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissPageBtnPressed(_ sender: UIButton) {
        //performSegue(withIdentifier: UNWIND_TO_ATTRIBUTES_VC, sender: self)
        delegate?.passData(data: self.wantNotes as Any)
        self.dismiss(animated: true, completion: nil)
    }
    
    func textViewDidChange(_ textView: UITextView) { //Handle the text changes here
        wantNotes = textView.text
    }
    
    func getWantNotes() -> String {
        return self.wantNotes!
    }
    
    func setWantNotes(notes: String) {
        self.wantNotes = notes
    }
    
    func setDelegate(delegate: DataReceivingVCProtocol) {
        self.delegate = delegate
    }
}

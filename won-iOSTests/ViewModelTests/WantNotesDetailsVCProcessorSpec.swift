//
//  WantNotesDetailsVCProcessorSpec.swift
//  won-iOSTests
//
//  Created by Elly Richardson on 3/26/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import Quick
import Nimble
import RealmSwift
@testable import won_iOS

class WantNotesDetailsVCProcessorSpec: QuickSpec {
    override func spec() {
        
        describe("WantNotesDetailsVCProcessor") {
            context("configureNotesTextView") {
                
                beforeSuite {
                    Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
                }
                
                beforeEach {
                    let realm = try! Realm()
                    try! realm.write {
                        realm.deleteAll()
                    }
                }
                
                it("notesTextView provided should have notes value of the ViewModel") {
                    // SETUP Area
                    let EXPECTED_NOTES = "TEST_NOTEZZ"
                    let want1 = WantPackager.packageAsSimpleWithUnspecifiedDaysLeft()
                    want1.setNotes(notes: EXPECTED_NOTES)
                    
                    let wantViewModel1 = WantModelConverter.convertToViewModel(want: want1)
                    
                    let dataAccess = WantRealmViewModelDataAccess()
                    let vcProcessor: WantNotesDetailsVCProcessor = WantNotesDetailsVCProcessorImpl(dataAccess: dataAccess, viewModel: wantViewModel1)
                    
                    let notesTextView = UITextView()
                    notesTextView.text = "defaultText"
                    
                    // RUN area
                    vcProcessor.configureNotesTextView(notesTextVew: notesTextView)

                    // ASSERTION area
                    expect(notesTextView.text).to(equal(EXPECTED_NOTES))
                }
                
            }
            
            context("saveNotesUpdate") {
                
                beforeSuite {
                    Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
                }
                
                beforeEach {
                    let realm = try! Realm()
                    try! realm.write {
                        realm.deleteAll()
                    }
                }
                
                it("should save the notes of ViewModel") {
                    // SETUP Area
                    let EXPECTED_NOTES = "TEST_NOTEZZ"
                    let INITIAL_NOTES = "intialNOTESS"
                    let want1 = WantPackager.packageAsSimpleWithNotification()
                    want1.setNotes(notes: INITIAL_NOTES)
                    
                    let wantViewModel1 = WantModelConverter.convertToViewModel(want: want1)
                    
                    let dataAccess = WantRealmViewModelDataAccess()
                    let vcProcessor: WantNotesDetailsVCProcessor = WantNotesDetailsVCProcessorImpl(dataAccess: dataAccess, viewModel: wantViewModel1)
                    
                    let notesTextView = UITextView()
                    notesTextView.text = EXPECTED_NOTES
                    
                    dataAccess.saveAsViewModel(viewModel: wantViewModel1)
                    var results: [WantViewModel] = dataAccess.findAllWants()
                    expect(results[0].getNotes()).to(equal(INITIAL_NOTES))
                    //vcProcessor.configureNotesTextView(notesTextVew: notesTextView)
                    vcProcessor.updateNotesTextView(textView: notesTextView)
                    
                    // RUN area
                    vcProcessor.saveNotesUpdate()

                    // ASSERTION area
                    results = dataAccess.findAllWants()
                    expect(results[0].getNotes()).to(equal(EXPECTED_NOTES))
                }
            }
            
            context("updateNotesTextView") {
                
                beforeSuite {
                    Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
                }
                
                beforeEach {
                    let realm = try! Realm()
                    try! realm.write {
                        realm.deleteAll()
                    }
                }
                
                it("should change the notes of the ViewModel with the value of the NotesTextView provided") {
                    // SETUP Area
                    let EXPECTED_NOTES = "TEST_NOTEZZ"
                    let INITIAL_NOTES = "intialNOTESS"
                    let want1 = WantPackager.packageAsSimpleWithNotification()
                    want1.setNotes(notes: INITIAL_NOTES)
                    
                    let wantViewModel1 = WantModelConverter.convertToViewModel(want: want1)
                    
                    let dataAccess = WantRealmViewModelDataAccess()
                    let vcProcessor: WantNotesDetailsVCProcessor = WantNotesDetailsVCProcessorImpl(dataAccess: dataAccess, viewModel: wantViewModel1)
                    
                    let notesTextView = UITextView()
                    notesTextView.text = EXPECTED_NOTES
                    
                    dataAccess.saveAsViewModel(viewModel: wantViewModel1)
                    var results: [WantViewModel] = dataAccess.findAllWants()
                    expect(results[0].getNotes()).to(equal(INITIAL_NOTES))
                    //vcProcessor.configureNotesTextView(notesTextVew: notesTextView)
                    vcProcessor.updateNotesTextView(textView: notesTextView)
                    
                    // RUN area
                    vcProcessor.updateNotesTextView(textView: notesTextView)
                    vcProcessor.saveNotesUpdate()

                    // ASSERTION area
                    results = dataAccess.findAllWants()
                    expect(results[0].getNotes()).to(equal(EXPECTED_NOTES))
                }
            }
        }
    }
}

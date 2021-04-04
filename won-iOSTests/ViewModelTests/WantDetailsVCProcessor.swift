//
//  WantDetailsVCProcessor.swift
//  won-iOSTests
//
//  Created by Elly Richardson on 4/3/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import Quick
import Nimble
import RealmSwift
import UIKit
@testable import won_iOS

class WantDetailsVCProcessorSpec: QuickSpec {
    override func spec() {
        
        describe("WantDetailsVCProcessorSpec") {
            context("configureDetachedEditWantVC()") {
                beforeSuite {
                    Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
                }
                
                beforeEach {
                    let realm = try! Realm()
                    try! realm.write {
                        realm.deleteAll()
                    }
                }
                
                it("detachedVC should have the wantViewModel and DetachedVCDelegate set") {
                    // SETUP Area
                    var editWantVC = EditWantVC()
                    
                    let want1 = WantPackager.packageAsSimpleWithUnspecifiedDaysLeft()
                    
                    let wantViewModel1 = WantModelConverter.convertToViewModel(want: want1)
                    wantViewModel1.setId(id: "unique")
                    
                    let vcProcessor: WantDetailsVCProcessor = WantDetailsVCProcessorImpl(viewModel: wantViewModel1)
                    let detachedVCDelegate = WantDetailsVC()
                    
                    // RUN area
                    editWantVC = vcProcessor.configureDetachedEditWantVC(detachedVC: editWantVC, delegateVC: detachedVCDelegate)

                    // ASSERTION area
                    //expect(notesTextView.text).to(equal(EXPECTED_NOTES))
                    expect(editWantVC.getWantViewModel()).to(be(wantViewModel1))
                    expect(editWantVC.getWantViewModel().getId()).to(be(wantViewModel1.getId()))
                    expect(editWantVC.getDetachedVCDelegate()).to(be(detachedVCDelegate))
                }
            }
            
            context("saveWantDetailsChanges()") {
                beforeSuite {
                    Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
                }
                
                beforeEach {
                    let realm = try! Realm()
                    try! realm.write {
                        realm.deleteAll()
                    }
                }
                
                it("should update dismissPageButton title with the name of viewModel, and the viewModel of the WantDetailsTableVC") {
                    // SETUP Area
                    let DA_NAME = "DA NAME"
                    let dismissPageButton = UIButton()
                    expect(dismissPageButton.title(for: .normal)).to(beNil())
                    
                    let want1 = WantPackager.packageAsSimpleWithUnspecifiedDaysLeft()
                    
                    let wantViewModel1 = WantModelConverter.convertToViewModel(want: want1)
                    wantViewModel1.setId(id: "unique")
                    wantViewModel1.setName(name: "DA NAME")
                    
                    let vcProcessor: WantDetailsVCProcessor = WantDetailsVCProcessorImpl(viewModel: wantViewModel1)
                    
                    let detailsTableVC = WantDetailsTableVC()
                    
                    // RUN area
                    vcProcessor.saveWantDetailsChanges(dismissPageBtn: dismissPageButton, detailsTableVC: detailsTableVC)

                    // ASSERTION area
                    expect(dismissPageButton.title(for: .normal)).to(equal("< " + DA_NAME))
                    let expectedWantViewModel = detailsTableVC.getWantViewModel()
                    expect(expectedWantViewModel).to(be(wantViewModel1))
                    expect(expectedWantViewModel.getId()).to(be(wantViewModel1.getId()))
                    expect(expectedWantViewModel.getName()).to(be(wantViewModel1.getName()))
                }
            }
            
            context("configureDismissPageBtn()") {
                beforeSuite {
                    Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
                }
                
                beforeEach {
                    let realm = try! Realm()
                    try! realm.write {
                        realm.deleteAll()
                    }
                }
                
                it("should update dismissPageButton title with the name of viewModel") {
                    // SETUP Area
                    let DA_NAME = "DA NAME"
                    let dismissPageButton = UIButton()
                    expect(dismissPageButton.title(for: .normal)).to(beNil())
                    
                    let want1 = WantPackager.packageAsSimpleWithUnspecifiedDaysLeft()
                    
                    let wantViewModel1 = WantModelConverter.convertToViewModel(want: want1)
                    wantViewModel1.setId(id: "unique")
                    wantViewModel1.setName(name: "DA NAME")
                    
                    let vcProcessor: WantDetailsVCProcessor = WantDetailsVCProcessorImpl(viewModel: wantViewModel1)
                    
                    // RUN area
                    vcProcessor.configureDismissPageBtn(dismissPageBtn: dismissPageButton)

                    // ASSERTION area
                    expect(dismissPageButton.title(for: .normal)).to(equal("< " + DA_NAME))
                }
            }
        }
        
    }
}

//
//  WantExactDetailsTableVCProcessorSpec.swift
//  won-iOSTests
//
//  Created by Elly Richardson on 3/21/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import Quick
import Nimble
import RealmSwift
@testable import won_iOS

class WantExactDetailsTableVCProcessorSpec: QuickSpec {
    override func spec() {
        
        describe("WantExactDetailsTableVCProcessor") {
            context("configureLabels()") {
                
                beforeSuite {
                    Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
                }
                
                beforeEach {
                    let realm = try! Realm()
                    try! realm.write {
                        realm.deleteAll()
                    }
                }

                it("should configure labels properly") {
                    // SETUP
                    let interestPointsValueLabel = UILabel()
                    interestPointsValueLabel.text = "default"
                    let dateCreatedValueLabel = UILabel()
                    dateCreatedValueLabel.text = "default"
                    let dateModifiedValueLabel = UILabel()
                    dateModifiedValueLabel.text = "default"
                    let obtainedAtValueLabel = UILabel()
                    obtainedAtValueLabel.text = "default"
                    let daysLeftValueLabel = UILabel()
                    daysLeftValueLabel.text = "default"
                    let obtainedValueLabel = UILabel()
                    obtainedValueLabel.text = "default"
                    
                    let dateCreatedString = "2021/03/11 12:30"
                    let dateModifiedString = "2021/03/12 12:30"
                    let dateObtainedAt = "2021/03/13 12:30"
                    
                    let want1 = WantPackager.packageAsObtainedWith(dateCreated: dateCreatedString, dateModified: dateModifiedString, dateObtainedAt: dateObtainedAt)
                    
                    let wantViewModel1 = WantModelConverter.convertToViewModel(want: want1)
                    
                    let vcProcessor: WantExactDetailsTableVCProcessor = WantExactDetailsTableVCProcessorImpl(dataAccess: WantRealmViewModelDataAccess(), viewModel: wantViewModel1)
                    
                    // RUN
                    vcProcessor.configureLabels(interestPointsValueLabel: interestPointsValueLabel, dateCreatedValueLabel: dateCreatedValueLabel, dateModifiedValueLabel: dateModifiedValueLabel, obtainedAtValueLabel: obtainedAtValueLabel, daysLeftValueLabel: daysLeftValueLabel, obtainedValueLabel: obtainedValueLabel)
                    
                    // ASSERTIONS
                    expect(interestPointsValueLabel.text).to(equal("76"))
                    expect(dateCreatedValueLabel.text).to(equal("11 Mar 2021"))
                    expect(dateModifiedValueLabel.text).to(equal("12 Mar 2021"))
                    expect(obtainedAtValueLabel.text).to(equal("13 Mar 2021"))
                    expect(daysLeftValueLabel.text).to(equal("30"))
                    expect(obtainedValueLabel.text).to(equal("OBTAINED"))
                }
                
                it("should configure labels properly and must have NOT OBTAINED") {
                    // SETUP
                    let interestPointsValueLabel = UILabel()
                    interestPointsValueLabel.text = "default"
                    let dateCreatedValueLabel = UILabel()
                    dateCreatedValueLabel.text = "default"
                    let dateModifiedValueLabel = UILabel()
                    dateModifiedValueLabel.text = "default"
                    let obtainedAtValueLabel = UILabel()
                    obtainedAtValueLabel.text = "default"
                    let daysLeftValueLabel = UILabel()
                    daysLeftValueLabel.text = "default"
                    let obtainedValueLabel = UILabel()
                    obtainedValueLabel.text = "default"
                    
                    let dateCreatedString = "2021/03/11 12:30"
                    let dateModifiedString = "2021/03/12 12:30"
                    let dateObtainedAt = "2021/03/13 12:30"
                    
                    let want1 = WantPackager.packageAsObtainedWith(dateCreated: dateCreatedString, dateModified: dateModifiedString, dateObtainedAt: dateObtainedAt)
                    want1.setObtained(obtained: false)
                    
                    let wantViewModel1 = WantModelConverter.convertToViewModel(want: want1)
                    
                    let vcProcessor: WantExactDetailsTableVCProcessor = WantExactDetailsTableVCProcessorImpl(dataAccess: WantRealmViewModelDataAccess(), viewModel: wantViewModel1)
                    
                    // RUN
                    vcProcessor.configureLabels(interestPointsValueLabel: interestPointsValueLabel, dateCreatedValueLabel: dateCreatedValueLabel, dateModifiedValueLabel: dateModifiedValueLabel, obtainedAtValueLabel: obtainedAtValueLabel, daysLeftValueLabel: daysLeftValueLabel, obtainedValueLabel: obtainedValueLabel)
                    
                    // ASSERTIONS
                    expect(interestPointsValueLabel.text).to(equal("76"))
                    expect(dateCreatedValueLabel.text).to(equal("11 Mar 2021"))
                    expect(dateModifiedValueLabel.text).to(equal("12 Mar 2021"))
                    expect(obtainedAtValueLabel.text).to(equal("13 Mar 2021"))
                    expect(daysLeftValueLabel.text).to(equal("30"))
                    expect(obtainedValueLabel.text).to(equal("NOT OBTAINED"))
                }
            }
            
            context("configureInteractables()") {
                
                beforeSuite {
                    Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
                }
                
                beforeEach {
                    let realm = try! Realm()
                    try! realm.write {
                        realm.deleteAll()
                    }
                }

                it("should have blank-radio-button image of obtained button when toggled from obtained") {
                    // SETUP
                    let obtainedBtn = UIButton()
                    let darkBlueOkImage = UIImage(named: "dark-blue-ok-image") as UIImage?
                    obtainedBtn.setBackgroundImage(darkBlueOkImage, for: .normal)
                    let want1 = WantPackager.packageAsSimpleWithNotification()
                    want1.setObtained(obtained: false)
                    
                    let wantViewModel1 = WantModelConverter.convertToViewModel(want: want1)
                    
                    let vcProcessor: WantExactDetailsTableVCProcessor = WantExactDetailsTableVCProcessorImpl(dataAccess: WantRealmViewModelDataAccess(), viewModel: wantViewModel1)
                    
                    // RUN
                    vcProcessor.configureInteractables(btn: obtainedBtn)
                    
                    // ASSERTIONS
                    expect(obtainedBtn.currentBackgroundImage).to(equal(UIImage(named: "blank-radio-button")))
                }
                
                it("should have dark-blue-ok-image image of obtained button when toggled from NOT obtained") {
                    // SETUP
                    let obtainedBtn = UIButton()
                    let darkBlueOkImage = UIImage(named: "blank-radio-button") as UIImage?
                    obtainedBtn.setBackgroundImage(darkBlueOkImage, for: .normal)
                    let want1 = WantPackager.packageAsSimpleWithNotification()
                    want1.setObtained(obtained: true)
                    
                    let wantViewModel1 = WantModelConverter.convertToViewModel(want: want1)
                    
                    let vcProcessor: WantExactDetailsTableVCProcessor = WantExactDetailsTableVCProcessorImpl(dataAccess: WantRealmViewModelDataAccess(), viewModel: wantViewModel1)
                    
                    // RUN
                    vcProcessor.configureInteractables(btn: obtainedBtn)
                    
                    // ASSERTIONS
                    expect(obtainedBtn.currentBackgroundImage).to(equal(UIImage(named: "dark-blue-ok-image")))
                }
            }
            
            context("obtainedBtnPressed()") {
                
                beforeSuite {
                    Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
                }
                
                beforeEach {
                    let realm = try! Realm()
                    try! realm.write {
                        realm.deleteAll()
                    }
                }

                it("should set WantViewModel to be obtained if not obtained yet, have the button to have backgroundImage of dark-blue-ok-image, update obtainedValueLabel to OBTAINED, and update the viewModel in realm") {
                    // SETUP
                    let obtainedBtn = UIButton()
                    let darkBlueOkImage = UIImage(named: "blank-radio-button") as UIImage?
                    obtainedBtn.setBackgroundImage(darkBlueOkImage, for: .normal)
                    let NOT_OBTAINED = "NOT_OBTAINED"
                    let obtainedValueLabel = UILabel()
                    obtainedValueLabel.text = NOT_OBTAINED
                    let want1 = WantPackager.packageAsSimpleWithNotification()
                    want1.setObtained(obtained: false)
                    
                    let wantViewModel1 = WantModelConverter.convertToViewModel(want: want1)
                    let dataAccess = WantRealmViewModelDataAccess()
                    let vcProcessor: WantExactDetailsTableVCProcessor = WantExactDetailsTableVCProcessorImpl(dataAccess: dataAccess, viewModel: wantViewModel1)
                    
                    dataAccess.saveAsViewModel(viewModel: wantViewModel1)
                    
                    var resultViewModel = dataAccess.findAllWants()[0]
                    expect(resultViewModel.isObtained()).to(beFalse())
                    expect(obtainedBtn.currentBackgroundImage).to(equal(UIImage(named: "blank-radio-button")))
                    expect(obtainedValueLabel.text).to(equal(NOT_OBTAINED))
                    
                    // RUN
                    vcProcessor.obtainedBtnPressed(btn: obtainedBtn, label: obtainedValueLabel)
                    
                    // ASSERTIONS
                    resultViewModel = dataAccess.findAllWants()[0]
                    expect(resultViewModel.isObtained()).to(beTrue())
                    expect(obtainedBtn.currentBackgroundImage).to(equal(UIImage(named: "dark-blue-ok-image")))
                    expect(obtainedValueLabel.text).to(equal("OBTAINED"))
                }
                
                it("should set WantViewModel to be NOT obtained if already obtained, have the button to have backgroundImage of blank-radio-button, update obtainedValueLabel to NOT OBTAINED, and update the viewModel in realm") {
                    // SETUP
                    let obtainedBtn = UIButton()
                    let darkBlueOkImage = UIImage(named: "dark-blue-ok-image") as UIImage?
                    obtainedBtn.setBackgroundImage(darkBlueOkImage, for: .normal)
                    let OBTAINED = "OBTAINED"
                    let obtainedValueLabel = UILabel()
                    obtainedValueLabel.text = OBTAINED
                    let want1 = WantPackager.packageAsSimpleWithNotification()
                    want1.setObtained(obtained: true)
                    
                    let wantViewModel1 = WantModelConverter.convertToViewModel(want: want1)
                    let dataAccess = WantRealmViewModelDataAccess()
                    let vcProcessor: WantExactDetailsTableVCProcessor = WantExactDetailsTableVCProcessorImpl(dataAccess: dataAccess, viewModel: wantViewModel1)
                    
                    dataAccess.saveAsViewModel(viewModel: wantViewModel1)
                    
                    var resultViewModel = dataAccess.findAllWants()[0]
                    expect(resultViewModel.isObtained()).to(beTrue())
                    expect(obtainedBtn.currentBackgroundImage).to(equal(UIImage(named: "dark-blue-ok-image")))
                    expect(obtainedValueLabel.text).to(equal(OBTAINED))
                    
                    // RUN
                    vcProcessor.obtainedBtnPressed(btn: obtainedBtn, label: obtainedValueLabel)
                    
                    // ASSERTIONS
                    resultViewModel = dataAccess.findAllWants()[0]
                    expect(resultViewModel.isObtained()).to(beFalse())
                    expect(obtainedBtn.currentBackgroundImage).to(equal(UIImage(named: "blank-radio-button")))
                    expect(obtainedValueLabel.text).to(equal("NOT OBTAINED"))
                }
            }
        }
    }
}

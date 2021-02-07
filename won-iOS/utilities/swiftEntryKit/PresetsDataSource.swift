//
//  SEKPresets.swift
//  won-iOS
//
//  Created by Elly Richardson on 2/2/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import SwiftEntryKit

struct PresetsDataSource {
    
    private enum ThumbDesc: String {
        case bottomToast = "ic_bottom_toast"
        case bottomFloat = "ic_bottom_float"
        case topToast = "ic_top_toast"
        case topFloat = "ic_top_float"
        case statusBarNote = "ic_sb_note"
        case topNote = "ic_top_note"
        case bottomPopup = "ic_bottom_popup"
    }
    
    static var displayMode = EKAttributes.DisplayMode.inferred
    private var displayMode: EKAttributes.DisplayMode {
        return PresetsDataSource.displayMode
    }
    
    static func getPopupPreset() -> EKAttributes {
        var presets: [PresetDescription] = []
        var attributes: EKAttributes
        var description: PresetDescription
        var descriptionString: String
        var descriptionThumb: String
        
        // Preset I
        attributes = .bottomFloat
        attributes.displayMode = displayMode
        attributes.displayDuration = .infinity
        attributes.screenBackground = .color(color: .dimmedDarkBackground)
        attributes.entryBackground = .color(color: .white)
        attributes.screenInteraction = .dismiss
        attributes.entryInteraction = .absorbTouches
        attributes.scroll = .edgeCrossingDisabled(swipeable: true)
        attributes.entranceAnimation = .init(
            translate: .init(
                duration: 0.5,
                spring: .init(damping: 1, initialVelocity: 0)
            )
        )
        attributes.exitAnimation = .init(
            translate: .init(duration: 0.35)
        )
        attributes.popBehavior = .animated(
            animation: .init(
                translate: .init(duration: 0.35)
            )
        )
        attributes.shadow = .active(
            with: .init(
                color: .black,
                opacity: 0.3,
                radius: 6
            )
        )
        
        let iPhone5sScreenSizeRation = CGFloat(0.6)
        let defaultScreenSizeRatio = CGFloat(0.4)
        
        /*
         This is a detector for device types
         */
        switch UIDevice.modelName {
        case "iPhone 5s":
            attributes.positionConstraints.size = .init(
                width: .offset(value: 30),
                height: .ratio(value: iPhone5sScreenSizeRation)
            )
        case "Simulator iPhone 5s":
        attributes.positionConstraints.size = .init(
            width: .offset(value: 30),
            height: .ratio(value: iPhone5sScreenSizeRation)
        )
        default:
            attributes.positionConstraints.size = .init(
                width: .offset(value: 30),
                height: .ratio(value: defaultScreenSizeRatio)
            )
        }
        
        let screenSize: CGRect = UIScreen.main.bounds
        let middleOfScreen = screenSize.height / 5
        
        attributes.positionConstraints.verticalOffset = middleOfScreen
        attributes.positionConstraints.safeArea = .overridden
        attributes.statusBar = .dark
        descriptionString = "Navigation flow with multiple view controllers"
        descriptionThumb = ThumbDesc.bottomPopup.rawValue
        description = .init(
            with: attributes,
            title: "Navigation Flow",
            description: descriptionString,
            thumb: descriptionThumb
        )
        presets.append(description)
        
        return attributes
    }
}

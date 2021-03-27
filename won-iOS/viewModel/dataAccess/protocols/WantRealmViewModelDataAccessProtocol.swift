//
//  WantRealmSourceProtocol.swift
//  won-iOS
//
//  Created by Elly Richardson on 12/4/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

protocol WantRealmViewModelDataAccessProtocol {
    func findAllWants() -> [WantViewModel]
    func updateObtainedAsViewModel(viewModel: WantViewModel)
    func updateNotesAsViewModel(viewModel: WantViewModel)
}

